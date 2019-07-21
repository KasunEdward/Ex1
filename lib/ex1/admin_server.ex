defmodule Ex1.AdminServer do
  @moduledoc false

  use GenServer

  # Client Functions

  def start_link(_opts) do
    GenServer.start_link(__MODULE__,[],name: __MODULE__)
  end

  def hello() do
    IO.puts("inside fun")
    GenServer.call(__MODULE__, {:hello})
  end

  def add_user(name,age) do
    user= %Ex1.User{name: name, age: age,status: 99}
    changeset =Ex1.User.changeset(user,%{})
    case Ex1.Repo.insert(changeset) do
      {:ok, _new_user} ->
        IO.puts("user inserted successfully")
      {:error, _error} ->
        IO.puts("error")
    end

  end

  # Server Functions

  @impl true
  def init(_opts) do
    {:ok, %{}}
  end

  @impl true
  def handle_call(:hello, _from, state) do
    IO.puts("hello world")
    {:reply, :ok, state}
  end

  @impl true
  def handle_call(_msg, _from, state) do
    {:reply, :ok, state}
  end

  @impl true
  def handle_cast(_msg, state) do
    {:noreply, state}
  end
end
