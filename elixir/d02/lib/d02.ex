defmodule D02 do
  require Integer

  def part1(input) do
    Enum.map(input, fn i -> get_differences(i) end)
    |> Enum.sum()
  end

  def part2(input) do
    Enum.map(input, fn i -> get_even_differences(i) end)
    |> Enum.sum()
  end

  defp get_differences(row) do
    min = Enum.min(row)
    max = Enum.max(row)
    max - min
  end

  defp get_even_differences(row) do
    Enum.sort(row)
    |> Enum.reverse()
    |> Enum.map(fn item ->
      {item, Enum.find(row, fn inner -> rem(item, inner) == 0 && item != inner end)}
    end)
    |> Enum.filter(fn item -> elem(item, 1) != nil end)
    |> Enum.map(fn item -> Integer.floor_div(elem(item, 0), elem(item, 1)) end)
    |> Enum.reduce(0, fn item, acc -> item + acc end)
  end
end
