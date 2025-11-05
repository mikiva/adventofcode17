defmodule D01 do


  def solve(input) do
    numbers = String.split(input, "", trim: true)
    |> Enum.map(fn n -> String.to_integer(n) end)


   # IO.inspect(numbers)
    range = 0..Enum.count(numbers) - 1
    range
    |> Enum.map(fn l -> check_if_next_match(numbers, l) end)
    |> Enum.filter(fn l -> elem(l, 0) end)
    |> Enum.map(fn l -> elem(l, 2) end)
    |> Enum.sum()



  end



  defp check_if_next_match(input, idx) do
    #current = String.at(input, idx)
    current = Enum.at(input, idx)
    next_index = rem(idx+1, Enum.count(input))
    next = Enum.at(input, next_index)
    found = current == next
#    IO.inspect({found ,idx , current, next})

    {found, idx, current, next}

  end

  def hello do
    :world
  end
end
