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

  def to_a
    @hash.keys
  end
end

class ScratchCard < Struct.new(:winning_nums, :numbers)
  def matches
    winning_nums & numbers
  end

  def points
    m = matches.size
    m > 0 ? 2**(m - 1) : 0
  end
end

# Parse cards
cards = $stdin.each_line.map do |line|
  line.chomp!
  game, lists = line.split(": ")
  _, card_no = game.split(" ")
  winning_nums, numbers = lists.split(" | ")

  winning_nums = HashSet.new(winning_nums.split(" ").map(&:to_i))
  numbers = HashSet.new(numbers.split(" ").map(&:to_i))

  card = ScratchCard.new(winning_nums, numbers)
  [card_no.to_i, card]
end
cards = cards.to_h

# Part I
score = cards.values.map(&:points).sum
puts "Part I: #{score}"

# Part II
copies = Hash.new(1)
cards_total = cards.sum do |card_no, card|
  n = copies[card_no]
  card.matches.size.times do |i|
    j = card_no + i + 1
    copies[j] = copies[j] + n
  end

  n
end

puts "Part II: #{cards_total}"

