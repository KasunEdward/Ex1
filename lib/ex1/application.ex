defmodule Ex1.Application do
  use Application

  def start(_type, _args) do
    # Although we don't use the supervisor name below directly,
    # it can be useful when debugging or introspecting the system.
    Ex1.Supervisor.start_link(name: Ex1.Supervisor)
  end
end
