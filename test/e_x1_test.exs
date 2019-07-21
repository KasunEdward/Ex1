defmodule EX1Test do
  use ExUnit.Case
  doctest EX1

  test "greets the world" do
    assert EX1.hello() == :world
  end
end
