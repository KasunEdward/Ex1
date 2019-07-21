defmodule Ex1.AdminServer do
  @moduledoc false
  @ten_seconds 20000
  require Ecto.Query


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
    # Process.send_after(self(), :update_user, @ten_seconds)
    :timer.apply_after(@ten_seconds, :gen_server, :cast, [self(), :update_user])
    {:ok, %{}}
  end

  # @impl true
  # def handle_info(:update_user, state) do
  #   IO.puts("Updating user")
  #   Process.send_after(self(), :update_user, @ten_seconds)
  #   {:noreply, state}
  # end

  # @impl true
  # def handle_info(_msg,  state) do
  #   {:reply, :ok, state}
  # end
  @impl true
  def handle_call(_msg, _from, state) do
    {:reply, :ok, state}
  end

  @impl true
  def handle_cast(:update_user, state) do
    IO.puts("Updating user")
    # users = Ex1.User |> Ecto.Query.where(status: 99) |> Ex1.Repo.all
    # changeset = Ex1.User.changeset(users, %{status: 1})
    # Ex1.Repo.update(changeset)
    result = Ecto.Query.from(u in Ex1.User, where: u.status == 99, update: [set: [status: 1]])
    |> Ex1.Repo.update_all([])
    IO.inspect(result)
    :timer.apply_after(@ten_seconds, :gen_server, :cast, [self(), :update_user])
    {:noreply, state}
  end

  @impl true
  def handle_cast(_msg, state) do
    {:noreply, state}
  end
end
