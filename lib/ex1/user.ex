defmodule Ex1.User do
    use Ecto.Schema
  
    schema "user" do
      field :name, :string
      field :age, :integer
      field :status, :integer
    end
  end