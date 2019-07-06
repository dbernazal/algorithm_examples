defmodule Strings.DuplicateCharactersTest do
  use ExUnit.Case

  describe "get_duplicate_characters/1" do
    test "it returns the duplicates when there is one present" do
      assert "f" = Strings.DuplicateCharacters.get_duplicate_characters("fhgjyfui")
    end

    test "it returns the duplicates when there is multiple present" do
      result = Strings.DuplicateCharacters.get_duplicate_characters("fhgjygfuhi")
      assert result =~ "f"
      assert result =~ "g"
      assert result =~ "h"
    end

    test "it returns the duplicates when there it is mixed case" do
      result = Strings.DuplicateCharacters.get_duplicate_characters("FhgfjyuGi")
      assert result =~ "f"
      assert result =~ "g"
    end

    test "it handles unicode characters" do
      result = Strings.DuplicateCharacters.get_duplicate_characters("FhgöGiö")
      assert result =~ "ö"
      assert result =~ "g"
    end

    test "it handles number characters" do
      result = Strings.DuplicateCharacters.get_duplicate_characters("Fhg5Gi5")
      assert result =~ "5"
      assert result =~ "g"
    end

    test "it handles special characters" do
      result = Strings.DuplicateCharacters.get_duplicate_characters("..g?G?5")
      assert result =~ "."
      assert result =~ "?"
      assert result =~ "g"
    end

    test "it handles an empty string" do
      assert "" = Strings.DuplicateCharacters.get_duplicate_characters("")
    end

    test "it handles non string characters" do
      test = 6

      assert_raise RuntimeError,
                   "Expected a binary but got: #{Kernel.inspect(test)}",
                   fn ->
                     Strings.DuplicateCharacters.get_duplicate_characters(test)
                   end
    end
  end
end
