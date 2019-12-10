defmodule TwoSum do
  @moduledoc """
    Get the first and last items
    Check sum
    sum > target shift the array to the left
    sum < target shift the array to the right
    sum = target, find indices of those values
  """
  def find(values, target) do
    {first, last} =
      values
      |> Enum.sort()
      |> find_sorted(target)

    [Enum.find_index(values, &(&1 == first)), Enum.find_index(values, &(&1 == last))]
    |> Enum.sort()
  end

  defp find_sorted([first | rest] = values, target) do
    last = List.last(values)
    sum = first + last

    cond do
      sum > target -> find_sorted(Enum.slice(values, 0..-2), target)
      sum < target -> find_sorted(rest, target)
      true -> {first, last}
    end
  end
end
