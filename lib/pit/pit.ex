defmodule Pit do
  def deepest_depth(list) do
    {nil, nil, nil}
    |> find_pit(list)
  end

  # Descending into the pit initially and found the first trough
  defp find_pit({nil, nil, nil}, [a, b | rest]) when a > b,
    do: find_pit({a, nil, nil}, [b] ++ rest)

  # Descending into the values
  defp find_pit({nil, nil, nil}, [a, b | rest]) when a < b,
    do: find_pit({nil, nil, nil}, [b] ++ rest)

  # Reached the end without ever seeing a pit
  defp find_pit({nil, nil, nil}, _), do: depth({nil, nil, nil})

  # Keep looking for the first trough
  defp find_pit({first, nil, nil}, [a, b | rest]) when a > b,
    do: find_pit({first, nil, nil}, [b] ++ rest)

  # Found the first trough let's start ascending back up
  defp find_pit({first, nil, nil}, [a, b | rest]) when a < b,
    do: find_pit({first, a, b}, [b] ++ rest)

  # Never found the first trough
  defp find_pit({_first, nil, nil}, _), do: depth({nil, nil, nil})

  # Found a potential pit but keep going
  defp find_pit({first, middle, _last}, [a, b | rest]) when a < b,
    do: find_pit({first, middle, b}, [b] ++ rest)

  # Found the edge of the pit but there is still more potential pits to be found
  defp find_pit(pit, [a, b | _rest] = list) when a > b,
    do: Kernel.max(depth(pit), deepest_depth(list))

  # Found a complete pit
  defp find_pit(pit, _), do: depth(pit)

  defp depth({nil, nil, nil}), do: -1
  defp depth({a, b, c}), do: Kernel.min(a - b, c - b)
end
