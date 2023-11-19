# Get input from file as a list (of elves) of list (of calories) of numbers
# each list contains the items a single elf is carying
# accumulate the numbers for each least so that you have a list (of all calories by each elve)

{:ok, contents} = File.read("input.txt")
{_highest_calories, index} = (contents
|> String.split("\n\n", trim: true)
|> Enum.map( fn elf -> String.split(elf, "\n", trim: true) end)
|> Enum.map( fn elf -> Enum.map(elf, &String.to_integer/1) end)
|> Enum.map( &Enum.sum/1)
|> Enum.with_index() 
|> Enum.sort(:desc)
|> hd())

IO.puts(index)