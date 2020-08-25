defmodule Gencounter.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    children = [
      # Starts a worker by calling: Gencounter.Worker.start_link(arg)
      # {Gencounter.Worker, arg}
      {Gencounter.Producer, 0},
      {Gencounter.ProducerConsumer, []},
      {Gencounter.Consumer, []}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Gencounter.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
