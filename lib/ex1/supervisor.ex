defmodule Ex1.Supervisor do
  @moduledoc false
  
  use Supervisor

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg)
  end

  def init(arg) do
    children = [
      {Ex1.AdminServer, name: __MODULE__}
    ]

    opts = [strategy: :one_for_one, name: Ex1.Supervisor]
    Supervisor.init(children, opts)
  end
end