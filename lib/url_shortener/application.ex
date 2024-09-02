defmodule UrlShortener.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      UrlShortenerWeb.Telemetry,
      UrlShortener.Repo,
      {DNSCluster, query: Application.get_env(:url_shortener, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: UrlShortener.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: UrlShortener.Finch},
      # Start a worker by calling: UrlShortener.Worker.start_link(arg)
      # {UrlShortener.Worker, arg},
      # Start to serve requests, typically the last entry
      UrlShortenerWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: UrlShortener.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    UrlShortenerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
