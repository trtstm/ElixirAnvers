# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :anvers,
  ecto_repos: [Anvers.Repo]

# Configures the endpoint
config :anvers, Anvers.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5tRsabO8nUFy9L+aKRqfVsgE6eBLO9QQsg/eWGF80lJjP81ovARp4ZuceRj5pYFq",
  render_errors: [view: Anvers.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Anvers.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :addict,
  secret_key: "243262243132247639562e562f6979356471544668566c586342342e2e",
  extra_validation: fn ({valid, errors}, user_params) -> {valid, errors} end, # define extra validation here
  user_schema: Anvers.User,
  repo: Anvers.Repo,
  from_email: "no-reply@example.com", # CHANGE THIS
  not_logged_in_url: "/admin/login",
mail_service: nil
