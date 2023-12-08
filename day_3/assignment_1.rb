input =
"467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598..
"

matrix = input.split("\n")
numbers_with_coordinates = []

matrix.each do |row|
    current_row_digit = ""
    current_row_coordinate = []

    row.split("").each_with_index do |charachter, index|
        if charachter =~ /\d/
            current_row_digit += charachter
            current_row_coordinate << index
        else
            # Only push if previous charachter was a digit
            unless current_row_digit.empty?
                number_with_coordinates = {
                   digit:  current_row_digit.to_i,
                   coordinates: current_row_coordinate
                }

                number_with_coordinates.push(param)
                current_row_digit = ""
                current_row_coordinate = []
            end
        end
    end
end

puts numbers_with_coordinates