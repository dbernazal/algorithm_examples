defmodule TwoSumTest do
  use ExUnit.Case

  test "simple case" do
    assert [0, 1] = TwoSum.find([2, 7, 11, 15], 9)
  end

  test "answer at the end of the list" do
    assert [6, 7] = TwoSum.find([20, 7, 8, 4, 2, 7, 11, 15], 26)
  end

  test "combination of negative and positive numbers" do
    assert [0, 1] = TwoSum.find([1, 9, 3, 4, -5], 10)
  end

  test "all negative numbers" do
    assert [2, 3] = TwoSum.find([-1, -9, -3, -4, -5], -7)
  end
end
