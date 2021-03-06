# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :pento,
  ecto_repos: [Pento.Repo]

config :pento_web,
  ecto_repos: [Pento.Repo],
  generators: [context_app: :pento]

# Configures the endpoint
config :pento_web, PentoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MW8GNMdzD6czEmraNVfmJc9ydvZPorYoxOPX1BdLQkszL3gnGv62BRIO0/T2A1tI",
  render_errors: [view: PentoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Pento.PubSub,
  live_view: [signing_salt: "tQit8PBs"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
