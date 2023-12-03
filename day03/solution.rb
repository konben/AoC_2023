def moore_neighbourhood(grid, y, x, len)
  neighbours = (y-1..y+1).map do |i|
    (x-1..x+len).map do |j|
      next if i < 0 || j < 0
      grid[i]&.[](j) unless i == y && (x...x+len).include?(j)
    end
  end

  neighbours.flatten.reject { |n| n.nil? }
end

def find_numbers(str)
  numbers = []
  i = 0
  while i = str.index(/\d+/, i)
    num = str[i..-1][/\d+/]
    numbers << [num, i]

    i = i + num.size
  end

  numbers
end

def part_numbers(schematic)
  numbers = []
  schematic.each_with_index do |line, i|
    find_numbers(line).each do |num, j|
      neighbours = moore_neighbourhood(schematic, i, j, num.size)
      numbers << num.to_i unless neighbours.reject { |n| n == "." }.empty?
    end
  end

  numbers
end

schematic = $stdin.each_line.map { |l| l.chomp }.to_a
p schematic
p moore_neighbourhood(schematic, 2, 6, 3)
p moore_neighbourhood(schematic, 2, 6, 3).size
p moore_neighbourhood(schematic, 4, 0, 3)
p moore_neighbourhood(schematic, 4, 0, 3).size
p find_numbers("467..114..")
p part_numbers(schematic)
puts "Part I: #{part_numbers(schematic).sum}"

