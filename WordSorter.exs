# Michal Obara mobaradev
# University of Nevada, Reno CS 491

defmodule WordSorter do
  def get_sorted_words(words) do
    Enum.sort(words)
  end
end

try do
  [ arg ] = System.argv() # accept exactly one argument
  try do
    {:ok, contents} = File.read(arg)
    contents = String.split(contents)
    words = WordSorter.get_sorted_words(contents)
    sorted_words = Enum.join(Enum.sort(words), " ")
    IO.puts(sorted_words)
  rescue
    _ -> IO.puts("Error: Unable to open file " <> arg)
  end
rescue _ ->
  IO.puts("Error: Invalid number of arguments.")
  IO.puts("Usage: ./#{Path.basename(__ENV__.file)} input_file")
end
