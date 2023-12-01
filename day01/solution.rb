def is_digit?(c)
  c =~ /\d/
end

coords = $stdin.map do |line|
  enum = line.each_char
  enum.find { |c| is_digit?(c) } + enum.reverse_each.find { |c| is_digit?(c) }
end
coords = coords.map { |c| c.to_i }

puts "Sum: #{coords.sum}"

