defmodule Knapsack do
  @type item :: %{
          value: integer(),
          weight: integer()
        }

  @spec max_value([item()], integer()) :: integer
  def max_value(items, capacity) do
    items
    |> sort_by_weight()
    |> build_capacity_matrix(capacity, %{})
    |> get_optimal_for_matrix(capacity)
  end

  defp get_optimal_for_matrix(matrix, capacity), do: Map.get(matrix, capacity)

  defp sort_by_weight(items), do: Enum.sort(items, &(&1.weight <= &2.weight))

  defp build_capacity_matrix([item | rest], total_capacity, previous_matrix) do
    best =
      for current_capacity <- 0..total_capacity, into: %{} do
        choose_item(previous_matrix, item, current_capacity)
      end

    build_capacity_matrix(rest, total_capacity, best)
  end

  defp build_capacity_matrix([], _total_capacity, previous_matrix), do: previous_matrix

  defp choose_item(previous_matrix, %{weight: weight} = item, current_capacity)
       when weight <= current_capacity do
    {current_capacity,
     max(
       item.value + get_optimal_for_capacity(previous_matrix, current_capacity - item.weight),
       get_optimal_for_capacity(previous_matrix, current_capacity)
     )}
  end

  defp choose_item(previous_matrix, _item, current_capacity),
    do: {current_capacity, get_optimal_for_capacity(previous_matrix, current_capacity)}

  defp get_optimal_for_capacity(previous_matrix, capacity),
    do: Map.get(previous_matrix, capacity, 0)
end
