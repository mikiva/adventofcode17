defmodule D01 do


  def part1(input) do
    numbers = String.split(input, "", trim: true)
    |> Enum.map(fn n -> String.to_integer(n) end)

    range = 0..Enum.count(numbers) - 1
    range
    |> Enum.map(fn l -> check_if_next_match(numbers, l) end)
    |> Enum.filter(fn l -> elem(l, 0) end)
    |> Enum.map(fn l -> elem(l, 2) end)
    |> Enum.sum()

  end


  def part2(input) do

    numbers = String.split(input, "", trim: true)
    |> Enum.map(fn n -> String.to_integer(n) end)

    range = 0..Enum.count(numbers) - 1
    range
    |> Enum.map(fn l -> check_if_half_ahead_match(numbers, l) end)
    |> Enum.filter(fn l -> elem(l, 0) end)
    |> Enum.map(fn l -> elem(l, 2) end)
    |> Enum.sum()

  end

  defp check_if_half_ahead_match(input, idx) do
    current = Enum.at(input, idx)
    n_idx = idx + Integer.floor_div(Enum.count(input), 2)
    next_index = rem(n_idx, Enum.count(input))
    next = Enum.at(input, next_index)
    found = current == next
    {found, idx, current, next}

  end

  defp check_if_next_match(input, idx) do
    current = Enum.at(input, idx)
    next_index = rem(idx+1, Enum.count(input))
    next = Enum.at(input, next_index)
    found = current == next

    {found, idx, current, next}

  end
end
