defmodule PitTest do
  use ExUnit.Case
  doctest Pit

  test "multiple pits" do
    test = [0, 1, 3, -2, 0, 1, 0, -3, 2, 3]
    assert Pit.deepest_depth(test) == 4
  end

  test "multiple pits again" do
    test = [100, 20, 0, 1, 1, 70]
    assert Pit.deepest_depth(test) == 1
  end

  test "a big list of values" do
    test = for _ <- [0..1_000_000], do: Enum.random(-100_000_000..100_000_000)
    Pit.deepest_depth(test)
  end

  test "ascending only values" do
    test = [0, 1, 3]
    assert Pit.deepest_depth(test) == -1
  end

  test "descending only values" do
    test = [3, 0, -1]
    assert Pit.deepest_depth(test) == -1
  end

  test "basic pit" do
    test = [2, 0, 3]
    assert Pit.deepest_depth(test) == 2
  end

  test "empty list" do
    test = []
    assert Pit.deepest_depth(test) == -1
  end

  test "1 value list" do
    test = [1]
    assert Pit.deepest_depth(test) == -1
  end

  test "2 value list" do
    test = [1, 0]
    assert Pit.deepest_depth(test) == -1
  end
end
