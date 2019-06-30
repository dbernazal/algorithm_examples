defmodule KnapsackTest do
  use ExUnit.Case

  test "0" do
    items = [
      %{value: 70, weight: 31},
      %{value: 20, weight: 10},
      %{value: 39, weight: 20},
      %{value: 37, weight: 19},
      %{value: 7, weight: 4},
      %{value: 5, weight: 3},
      %{value: 10, weight: 6}
    ]

    assert Knapsack.max_value(items, 50) == 107
  end

  test "1" do
    items = [
      %{value: 350, weight: 25},
      %{value: 400, weight: 35},
      %{value: 450, weight: 45},
      %{value: 20, weight: 5},
      %{value: 70, weight: 25},
      %{value: 8, weight: 3},
      %{value: 5, weight: 2},
      %{value: 5, weight: 2}
    ]

    assert Knapsack.max_value(items, 104) == 900
  end

  test "2" do
    items = [
      %{value: 3, weight: 1},
      %{value: 8, weight: 2},
      %{value: 5, weight: 3},
      %{value: 2, weight: 6},
      %{value: 3, weight: 8}
    ]

    assert Knapsack.max_value(items, 8) == 16
  end
end
