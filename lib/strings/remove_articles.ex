defmodule Strings.RemoveArticles.Match do
  def remove(test), do: remove(test, []) |> Enum.join("")

  def remove(" the " <> rest, parts), do: remove("  " <> rest, parts)
  def remove(" an " <> rest, parts), do: remove("  " <> rest, parts)
  def remove(" a " <> rest, parts), do: remove("  " <> rest, parts)
  def remove(" the", parts), do: [parts | ["  "]]
  def remove(" an", parts), do: [parts | ["  "]]
  def remove(" a", parts), do: [parts | ["  "]]
  def remove(<<test::bytes-size(1)>> <> rest, parts), do: remove(rest, [parts | test])
  def remove("", parts), do: [parts]
end

defmodule Strings.RemoveArticles.Split do
  def remove(test),
    do:
      String.split(test, " ")
      |> Enum.map(fn article ->
        case is_article?(article) do
          true -> ""
          false -> article
        end
      end)
      |> Enum.join(" ")

  defp is_article?(article) when article in ["a", "an", "the"], do: true
  defp is_article?(_article), do: false
end
