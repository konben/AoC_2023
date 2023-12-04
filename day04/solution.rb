class HashSet
  def initialize(values = [])
    @hash = values.map { |x| [x, true] }.to_h
  end

  def include?(x)
    @hash[x]
  end

  def &(other)
    values = @hash.keys.filter { |x| other.include?(x) }
    HashSet.new(values)
  end

  def size
    @hash.size
  end
end

score = $stdin.each_line.sum do |line|
  line.chomp!
  _, lists = line.split(": ")
  winning_nums, numbers = lists.split(" | ")

  winning_nums = HashSet.new(winning_nums.split(" ").map(&:to_i))
  numbers = HashSet.new(numbers.split(" ").map(&:to_i))

  matches = (winning_nums & numbers).size
  matches > 0 ? 2**(matches - 1) : 0
end

puts "Part I: #{score}"

