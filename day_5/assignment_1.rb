module Day5
  class Assignment1

    def perform
        create_seeds
        convert_seeds_to_soil # 81, 14, 57, 13
        convert_soils_to_fertilizer # 81, 53, 57, 52
        convert_fertilizers_to_water # 81, 49, 53, 41
        convert_waters_to_light # 74, 42, 46, 34
        convert_lights_to_temparature # 78, 42, 82, 34
        convert_temparatures_to_humidity # 78, 43, 82, 35
        convert_humidity_to_location # 82, 43, 86, 35
        puts convert_humidity_to_location.min # 35
    end

    private

    def create_seeds
      @create_seeds ||= maps[0].partition(":").last.split.map(&:to_i)
    end

    def convert_seeds_to_soil
      @convert_seeds_to_soil ||= calculate_new_values(create_seeds, parse_map(1))
    end

    def convert_soils_to_fertilizer
      @convert_soils_to_fertilizer ||= calculate_new_values(convert_seeds_to_soil, parse_map(2))
    end

    def convert_fertilizers_to_water
      @convert_fertilizers_to_water ||= calculate_new_values(convert_soils_to_fertilizer, parse_map(3))
    end

    def convert_waters_to_light
      @convert_waters_to_light ||= calculate_new_values(convert_fertilizers_to_water, parse_map(4))
    end

    def convert_lights_to_temparature
      @convert_lights_to_temparature ||= calculate_new_values(convert_waters_to_light, parse_map(5))
    end

    def convert_temparatures_to_humidity
      @convert_temparatures_to_humidity ||= calculate_new_values(convert_lights_to_temparature, parse_map(6))
    end

    def convert_humidity_to_location
      @convert_humidity_to_location ||= calculate_new_values(convert_temparatures_to_humidity, parse_map(7))
    end

    def input
        "seeds: 79 14 55 13

seed-to-soil map:
50 98 2
52 50 48

soil-to-fertilizer map:
0 15 37
37 52 2
39 0 15

fertilizer-to-water map:
49 53 8
0 11 42
42 0 7
57 7 4

water-to-light map:
88 18 7
18 25 70

light-to-temperature map:
45 77 23
81 45 19
68 64 13

temperature-to-humidity map:
0 69 1
1 0 69

humidity-to-location map:
60 56 37
56 93 4"
    end

    def maps
        @maps ||= input.split("\n\n")
    end

    def parse_map(index)
        maps[index].split("\n").map.with_index do |line, index|
            next if index == 0 # Rubrik..

            values = line.split
            {
                destination: values[0].to_i,
                source: values[1].to_i,
                length: values[2].to_i
            }
        end.compact
    end

    def calculate_new_values(init_values, convertable_array)
        init_values.map do |init_value|
            current_value = -1

            convertable_array.each do |convertable_entry|
                offset = (convertable_entry[:length] - 1)
                range_beninging = convertable_entry[:source]
                range_end = range_beninging + offset

                next unless init_value.between?(range_beninging, range_end)
                distance = convertable_entry[:destination] - convertable_entry[:source]

                current_value = init_value + distance
                break
            end

            current_value == -1 ? init_value : current_value
        end
    end
  end
end

Day5::Assignment1.new.perform