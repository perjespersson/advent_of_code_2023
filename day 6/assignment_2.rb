input =
"Time:        51     69     98     78
Distance:   377   1171   1224   1505"

split_input = input.split("\n")
time = split_input.first.partition(":").last.gsub(/\s+/, "").to_i
record = split_input.last.partition(":").last.gsub(/\s+/, "").to_i

ways_to_win = 0
(time + 1).times do |i|
    distance = i * (time - i)
    ways_to_win += 1 if distance > record
end

puts "==================="
puts ways_to_win
puts "==================="