input =
"0 3 6 9 12 15
1 3 6 10 15 21
10 13 16 21 30 45
"

start_time = (Time.now.to_f * 1000).to_i

sequences_array = []
splitted_input = input.split("\n")
input.each_line do |line|
  splitted_lines = line.split(" ").map(&:to_i)

  sequences = [splitted_lines]
  # Loop as long there is not just zeroes
  while !((splitted_lines.uniq.count == 1) && (splitted_lines.uniq.first == 0)) do
    temp_array = []
    (splitted_lines.count - 1).times do |index|
      difference = splitted_lines[index + 1] - splitted_lines[index]
      temp_array.push(difference)
    end

    splitted_lines = temp_array
    sequences.push(splitted_lines)
  end

  sequences_array.push(sequences)
end

puts sequences_array



end_time = (Time.now.to_f * 1000).to_i

puts "========="
puts "Total time: #{end_time - start_time} ms"
puts "========="