defmodule Pento.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Pento.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Pento.PubSub}
      # Start a worker by calling: Pento.Worker.start_link(arg)
      # {Pento.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Pento.Supervisor)
  end
end
