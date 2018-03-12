class Deck

  def initialize
    # @ranks = %w(2 3 4 5 6 7 8 9 10 11 12 13 14)
    # @suits = %w(C D H S)
    @ranks = %w(9 10 11 12 13 14)
    @suits = %w(H S)
    @cards = []

    @ranks.each do |rank|
      @suits.each do |suit|
        @cards << Card.new(rank, suit)
        end
      end
  end
  
  def color
    if @suit == "C" || @suit == "S"
      color = "black" 
      else
      color = "red"
    end
  end

  def deal
    @cards.shift
  end

  def add_to_bottom(card)
    @cards.unshift(card)
  end

  def add_to_top(card)
    @cards << card
  end

  def count
    @cards.count
  end

  def empty?
    @cards.empty?
  end

  def shuffle!
    @cards.shuffle!
  end
  
  def to_s
    result = ''
    @cards.each do |card|
      result = result + card.to_s + " "
    end
    return result
  end
end


class Card
  attr_reader :rank, :suit
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    if @rank.to_i <= 10
      "#{@rank}(#{@suit})"
    elsif @rank.to_i == 11
      "J(#{@suit})"
    elsif @rank.to_i == 12
      "Q(#{@suit})"
    elsif @rank.to_i == 13
      "K(#{@suit})"
    elsif @rank.to_i == 14
      "A(#{@suit})"
    end
  end
  
  def ==(other)
    if (self.rank && other.rank) && (self.rank && other.suit)
      return true
    end  
  end
end

# move card from deck to stack
def move_card(draw, play)
  if play.empty? && draw.any?
    play << draw.shift
  elsif draw.any? && (within_one(draw[0].rank.to_i, play[-1].rank.to_i))
    play << draw.shift
  else
  end
end

# move card from stack to stack
def move_pile(play1, play2)
  if play2.empty?
    play2.concat(play1)
    play1.clear
  elsif (within_one(play1[0].rank.to_i, play2[-1].rank.to_i) && (within_one(play1[0].rank.to_i, play2[-1].rank.to_i)))
      print "front or back?"
      side=gets.chomp
      if side == "front"
        play1.concat(play2)
        play2.clear  
      elsif side == "back"
        play2.concat(play1)
        play1.clear
      else
      end
  elsif (within_one(play1[0].rank.to_i, play2[-1].rank.to_i))
      play1.concat(play2)
      play1.clear
  elsif (within_one(play1[0].rank.to_i, play2[0].rank.to_i))
      play1.concat(play2)
      play1.clear
  else
  end
end

def within_one(x,y)
  if x==y
    return true
  elsif x==(y-1)
    return true
  elsif x==(y+1)
    return true
  else
    return false
  end
end

def show_board_show_draw(d1,d2,d3,d4,p5,p6,p7,p8)
  # puts `clear`
  puts "\e[H\e[2J"
  puts "   Drawing decks"
  puts "--------------------"
  puts "    #1: [ #{d1.join(' ')} ]"
  puts "    #2: [ #{d2.join(' ')} ]"
  puts "    #3: [ #{d3.join(' ')} ]"
  puts "    #4: [ #{d4.join(' ')} ]"
  puts ""
  puts "   Playing stacks"
  puts "--------------------"
  puts "   #5: [ #{p5.join(' ')} ]"
  puts "   #6: [ #{p6.join(' ')} ]"
  puts "   #7: [ #{p7.join(' ')} ]"
  puts "   #8: [ #{p8.join(' ')} ]"
  puts ""
end

def show_board_hide_draw(d1,d2,d3,d4,p5,p6,p7,p8)
  puts "\e[H\e[2J"
  # puts `clear`
  puts "   Drawing decks"
  puts "--------------------"
  puts "    #1: [ #{d1[0]} ] #{d1.count} left"
  puts "    #2: [ #{d2[0]} ] #{d2.count} left"
  puts "    #3: [ #{d3[0]} ] #{d3.count} left"
  puts "    #4: [ #{d4[0]} ] #{d4.count} left"
  puts ""
  puts "   Playing stacks"
  puts "--------------------"
  puts "   #5: [ #{p5.join(' ')} ]"
  puts "   #6: [ #{p6.join(' ')} ]"
  puts "   #7: [ #{p7.join(' ')} ]"
  puts "   #8: [ #{p8.join(' ')} ]"
  puts ""
end

# Initialize new deck and shuffle
my_deck = Deck.new
my_deck.shuffle!

# Initialize card piles
d1, d2, d3, d4, p5, p6, p7, p8 = [], [], [], [], [], [], [], []

# Deal shuffled cards into four piles (card arrays)
while my_deck.count > 0 do
  d1 << my_deck.deal
  d2 << my_deck.deal
  d3 << my_deck.deal
  d4 << my_deck.deal
end

# Move top cards of each draw deck to play stack
p5 << d1.shift
p6 << d2.shift
p7 << d3.shift
p8 << d4.shift

# Show Game Status
# show_board_show_draw(d1,d2,d3,d4,p5,p6,p7,p8)
show_board_hide_draw(d1,d2,d3,d4,p5,p6,p7,p8)

# Run loop until win
while (d1.any? || d2.any? || d3.any? || d4.any?)
  print "Move from pile? "
  from=gets.chomp
  if from=='quit'
    puts "\n You quit"
    exit(0)
  else
  end
  print "Move  to  pile? "
  to=gets.chomp
  case from
  when '1' 
    if to=='5' then (move_card(d1, p5)) else end
    if to=='6' then (move_card(d1, p6)) else end
    if to=='7' then (move_card(d1, p7)) else end
    if to=='8' then (move_card(d1, p8)) else end
  when '2'
    if to=='5' then (move_card(d2, p5)) else end
    if to=='6' then (move_card(d2, p6)) else end
    if to=='7' then (move_card(d2, p7)) else end
    if to=='8' then (move_card(d2, p8)) else end   
  when '3'
    if to=='5' then (move_card(d3, p5)) else end
    if to=='6' then (move_card(d3, p6)) else end
    if to=='7' then (move_card(d3, p7)) else end
    if to=='8' then (move_card(d3, p8)) else end
  when '4'
    if to=='5' then (move_card(d4, p5)) else end
    if to=='6' then (move_card(d4, p6)) else end
    if to=='7' then (move_card(d4, p7)) else end
    if to=='8' then (move_card(d4, p8)) else end 
  when '5'
    if to=='6' then (move_pile(p5, p6)) else end
    if to=='7' then (move_pile(p5, p7)) else end
    if to=='8' then (move_pile(p5, p8)) else end
  when '6'
    if to=='5' then (move_pile(p6, p5)) else end
    if to=='7' then (move_pile(p6, p7)) else end
    if to=='8' then (move_pile(p6, p8)) else end 
  when '7'
    if to=='5' then (move_pile(p7, p5)) else end
    if to=='6' then (move_pile(p7, p6)) else end
    if to=='8' then (move_pile(p7, p8)) else end 
  when '8'
    if to=='5' then (move_pile(p8, p5)) else end
    if to=='6' then (move_pile(p8, p6)) else end
    if to=='7' then (move_pile(p8, p7)) else end
  when 'quit'
    break
  end
  # show_board_show_draw(d1,d2,d3,d4,p5,p6,p7,p8)
  show_board_hide_draw(d1,d2,d3,d4,p5,p6,p7,p8)
end

if !((d1.any? || d2.any? || d3.any? || d4.any?))
  puts "\n  YOU WIN!"
else
  puts "\n  You quit."
end