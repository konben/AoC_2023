english_digits = /(?=([1-9]|one|two|three|four|five|six|seven|eight|nine))/
digit_map = {
  "one" => "1",
  "two" => "2",
  "three" => "3",
  "four" => "4",
  "five" => "5",
  "six" => "6",
  "seven" => "7",
  "eight" => "8",
  "nine" => "9",
}
digit_map.default_proc = proc { |_, key| key }

coords = $stdin.map do |line|
  digits = line.scan(english_digits).flatten
  (digit_map[digits.first] + digit_map[digits.last]).to_i
end

puts "Sum: #{coords.sum}"

