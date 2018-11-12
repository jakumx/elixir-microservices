defmodule MicroserviceWeb.UserController do
  use MicroserviceWeb, :controller

  alias Microservice.Users
  alias Microservice.Users.User

  action_fallback MicroserviceWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Users.create_user(params) do
      conn
        |> put_status(:created)
        |> json(set_user_map(user))
    end
  end

  def show(conn, %{"id" => id}) do
    try do
      user = Users.get_user!(id)

      conn
        |> put_status(:ok)
        |> json(set_user_map(user))
    rescue
      Ecto.NoResultsError -> conn
        |> put_status(:not_found)
        |> json(%{
          errors: %{
            id: ["not found"]
          }
        })
    end
  end

  def update(conn, params) do
    user = Users.get_user!(params["id"])
    with {:ok, %User{} = user} <- Users.update_user(user, params) do

      conn
        |> put_status(:ok)
        |> json(set_user_map(user))
    end
  end

  defp set_user_map(user) do
    %{
      id: user.id,
      name: user.name,
      email: user.email
    }
  end
end
