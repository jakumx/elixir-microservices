defmodule MicroserviceWeb.Router do
  use MicroserviceWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MicroserviceWeb do
    pipe_through :api

    # get "/user", UserController, :index
    resources "/users", UserController, only: [:create, :show, :update]
  end
end
