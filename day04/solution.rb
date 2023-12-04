score = $stdin.each_line.sum do |line|
  line.chomp!
  _, lists = p line.split(": ")
  winning_nums, numbers = p lists.split(" | ")

  winning_nums = p winning_nums.split(" ").map! { |n| [n.to_i, true] }.to_h
  numbers = p numbers.split(" ").map { |n| n.to_i }

  matches = numbers.count { |n| winning_nums[n] }
  matches > 0 ? 2**(matches - 1) : 0
end

puts "Part I: #{score}"

