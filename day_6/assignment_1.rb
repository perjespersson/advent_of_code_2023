input =
"Time:        51     69     98     78
Distance:   377   1171   1224   1505"

split_input = input.split("\n")
time_row = split_input.first.partition(":").last.split
record_row = split_input.last.partition(":").last.split

parsed_races = time_row.map.with_index do |race, index|
            {
                time: time_row[index].to_i,
                record: record_row[index].to_i
            }
        end

total_ways_to_win = []
parsed_races.each do |race|
    formula = race[:time] +
    ways_to_win = 0

    (race[:time] + 1).times do |i|
        distance = i * (race[:time] - i)
        ways_to_win += 1 if distance > race[:record]
    end

    total_ways_to_win.push(ways_to_win)
end

puts "==================="
puts total_ways_to_win.reduce(:*)
puts "==================="