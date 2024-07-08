defmodule Lattix.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      LattixWeb.Telemetry,
      Lattix.Repo,
      {DNSCluster, query: Application.get_env(:lattix, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Lattix.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Lattix.Finch},
      # Start a worker by calling: Lattix.Worker.start_link(arg)
      # {Lattix.Worker, arg},
      # Start to serve requests, typically the last entry
      LattixWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Lattix.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LattixWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
