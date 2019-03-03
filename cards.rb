require 'colorize'

class Deck

  def initialize
    @ranks = %w(2 3 4 5 6 7 8 9 10 11 12 13 14)
    @suits = %w(♣ ♦ ♥ ♠)
    # @ranks = %w(9 10 11 12 13 14)
    # @suits = %w(H S)
    @cards = []

    @ranks.each do |rank|
      @suits.each do |suit|
        @cards << Card.new(rank, suit)
        end
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
    @color = color
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
  
  def color
    if @suit == "♥" || @suit == "♦"
      color = "red" 
    else
      color = "black"
    end
  end
  
  
  def ==(other)
    if (self.rank && other.rank) && (self.rank && other.suit)
      return true
    end  
  end
  
end

### Functions Library

# move card from deck to stack
def move_card(draw, play)
  if play.empty? && draw.any?
    play << draw.shift
  elsif draw.any? && (within_one?(draw[0].rank.to_i, play[-1].rank.to_i))
    play << draw.shift
  else
  end
end

# move card from stack to stack
# def move_pile(play1, play2)
#   if play2.empty?
#     play2.concat(play1)
#     play1.clear
#   elsif (within_one?(play1[0].rank.to_i, play2[-1].rank.to_i) && (within_one?(play1[0].rank.to_i, play2[-1].rank.to_i)))
#       print "front or back?"
#       side=gets.chomp
#       if side == "front"
#         play1.concat(play2)
#         play2.clear  
#       elsif side == "back"
#         play2.concat(play1)
#         play1.clear
#       else
#       end
#   elsif (within_one?(play1[0].rank.to_i, play2[-1].rank.to_i))
#       play1.concat(play2)
#       play1.clear
#   elsif (within_one?(play1[0].rank.to_i, play2[0].rank.to_i))
#       play1.concat(play2)
#       play1.clear
#   else
#   end
# end

# Move pile of cards *Experimental*
def move_pile(play1, play2)
  if play2.empty?
    play2.concat(play1)
    play1.clear
  elsif (within_one?(play1[0].rank.to_i, play2[-1].rank.to_i))
    play2.concat(play1)
    play1.clear
  else
  end
end

def within_one?(x,y)
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
  system "clear" 
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
  system "clear" 
  puts "   Drawing decks"
  puts "--------------------"
  print "    #1: [ "
  color_print(d1[0])
  puts "] #{d1.count} left"
  print "    #2: [ "
  color_print(d2[0])
  puts "] #{d2.count} left"
  print "    #3: [ "
  color_print(d3[0])
  puts "] #{d3.count} left"
  print "    #4: [ "
  color_print(d4[0])
  puts "] #{d4.count} left"
  puts ""
  puts "   Playing stacks"
  puts "--------------------"
  print "   #5: [ "
  p5.each { |card| color_print(card) }
  puts"]"
  print "   #6: [ "
  p6.each { |card| color_print(card) }
  puts"]"
  print "   #7: [ "
  p7.each { |card| color_print(card) }
  puts"]"
  print "   #8: [ "
  p8.each { |card| color_print(card) }
  puts"]"
  
  puts ""
end

def color_print(card)
  if card.nil? 
    return 
  end
  if card.color == "red"
    print "#{card} ".red
  else
    print "#{card} ".blue
  end
end
