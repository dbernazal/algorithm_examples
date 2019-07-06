defmodule Strings.DuplicateCharacters do
  def get_duplicate_characters(string) when is_binary(string) do
    string
    |> String.split("")
    |> build_duplicates()
  end

  def get_duplicate_characters(string) do
    raise RuntimeError, "Expected a binary but got: #{Kernel.inspect(string)}"
  end

  defp build_duplicates(characters) do
    characters
    |> build_histogram()
    |> filter_non_duplicate_characters()
    |> build_duplicate_string()
  end

  defp build_histogram(characters) do
    characters
    |> Enum.reduce(%{}, fn char, dupe_map ->
      Map.update(dupe_map, String.downcase(char), 0, &(&1 + 1))
    end)
  end

  defp filter_non_duplicate_characters(dupe_map),
    do: Enum.filter(dupe_map, fn {_key, value} -> value != 0 end)

  defp build_duplicate_string(dupe_map),
    do: Enum.reduce(dupe_map, "", fn {char, _count}, acc -> acc <> char end)
end
