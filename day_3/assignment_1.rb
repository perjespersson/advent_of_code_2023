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

matrix = input.split("\n").map{ |row| row.split("") }
numbers_with_coordinates = []

# Parse out the digits with their corresponding coordinates
input.each_line.with_index do |row, outer_index|
  current_row_digit = ""
  current_row_coordinates = []

  row.split("").each_with_index do |charachter, inner_index|
    if charachter =~ /\d/
      current_row_digit += charachter
      current_row_coordinates << inner_index
    else
      # Only push if previous charachter was a digit
      unless current_row_digit.empty?
        number_with_coordinates = {
          digit:  current_row_digit.to_i,
          coordinates: current_row_coordinates,
          index: outer_index
        }

        numbers_with_coordinates.push(number_with_coordinates)

        # Reset the variables to make room for a new digit
        current_row_digit = ""
        current_row_coordinates = []
      end
    end
  end
end

numbers_with_coordinates.each_with_index do |number_with_coordinates, index|
  above_index = number_with_coordinates[:index] - 1
  below_index = number_with_coordinates[:index] + 1
  symbol_found = false

  # Check above
  if above_index > -1
    number_with_coordinates[:coordinates].each do |coordinate|
      unless matrix[above_index][coordinate] =~ /\d/ || matrix[above_index][coordinate] == "."
        # puts "SYMBOL FOUND"
      end
    end
  end

  # Check to left, parallel as well
  if number_with_coordinates[:coordinates].first > 0
    puts "SYMBOL FOUND" unless matrix[above_index][number_with_coordinates[:coordinates].first - 1] =~ /\d/ || matrix[above_index][number_with_coordinates[:coordinates].first - 1] == "." # Need to check in range
    puts "SYMBOL FOUND" unless matrix[index][number_with_coordinates[:coordinates].first - 1] =~ /\d/ || matrix[index][number_with_coordinates[:coordinates].first - 1] == "."
    puts "SYMBOL FOUND" unless matrix[below_index][number_with_coordinates[:coordinates].first - 1] =~ /\d/ || matrix[below_index][number_with_coordinates[:coordinates].first - 1] == "." # Need to check in range
  end

  # Check to right
  if (matrix.first.count - 1) > number_with_coordinates[:coordinates].first
  end

  # Check below, parallel as well
  if below_index < matrix.count
    number_with_coordinates[:coordinates].each do |coordinate|
      unless matrix[below_index][coordinate] =~ /\d/ || matrix[below_index][coordinate] == "."
        # puts "SYMBOL FOUND"
      end
    end
  end
end