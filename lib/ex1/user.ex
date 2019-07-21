defmodule Ex1.User do
    use Ecto.Schema
  
    schema "user" do
      field :name, :string
      field :age, :integer
      field :status, :integer
    end

    def changeset(user, params \\ %{}) do
      user
      |> Ecto.Changeset.cast(params, [:name, :age, :status])
      |> Ecto.Changeset.validate_required([:name, :age, :status])
    end
  end