defmodule Ex1.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :name, :string
      add :age, :integer
      add :status, :integer
    end
  end
end
