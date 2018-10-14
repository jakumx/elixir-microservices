# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :microservice,
  ecto_repos: [Microservice.Repo]

# Configures the endpoint
config :microservice, MicroserviceWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "x7LZNFutFV0vf7vwlAQFrkfbbKtfbq/IB8uI++XBOoosvM4R98OgU3QFoI4OGHzI",
  render_errors: [view: MicroserviceWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Microservice.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
