require_relative 'cards.rb'

def show_board(drawpile_1,drawpile_2,drawpile_3,drawpile_4,playpile_5,playpile_6,playpile_7,playpile_8)
  system "clear" 
  puts "   Drawing decks"
  puts "--------------------"
  # puts "    #1: [ #{drawpile_1.join(' ')} ]"
  # puts "    #2: [ #{drawpile_2.join(' ')} ]"
  # puts "    #3: [ #{drawpile_3.join(' ')} ]"
  # puts "    #4: [ #{drawpile_4.join(' ')} ]"
  puts "   #1: [ #{drawpile_1[0]} ]"
  puts "   #2: [ #{drawpile_2[0]} ]"
  puts "   #3: [ #{drawpile_3[0]} ]"
  puts "   #4: [ #{drawpile_4[0]} ]"
  puts ""
  puts "   Playing stacks"
  puts "--------------------"
  puts "   #5: [ #{playpile_5.join(' ')} ]"
  puts "   #6: [ #{playpile_6.join(' ')} ]"
  puts "   #7: [ #{playpile_7.join(' ')} ]"
  puts "   #8: [ #{playpile_8.join(' ')} ]"
  puts ""
end

my_deck = Deck.new
my_deck.shuffle!

#initialize card piles
drawpile_1, drawpile_2, drawpile_3, drawpile_4 = [], [], [], []
playpile_5, playpile_6, playpile_7, playpile_8 = [], [], [], []

# Deal shuffled cards into four piles
while my_deck.count > 0 do
  drawpile_1 << my_deck.deal
  drawpile_2 << my_deck.deal
  drawpile_3 << my_deck.deal
  drawpile_4 << my_deck.deal
end

# Move top cards of discard pile to play pile
playpile_5 << drawpile_1.shift
playpile_6 << drawpile_2.shift
playpile_7 << drawpile_3.shift
playpile_8 << drawpile_4.shift

# Show Game Status
show_board(drawpile_1,drawpile_2,drawpile_3,drawpile_4,playpile_5,playpile_6,playpile_7,playpile_8)

while (!drawpile_1.empty? || !drawpile_2.empty? || !drawpile_3.empty? || !drawpile_4.empty?)
  print "Move from pile? "
  n=gets.chomp
  print "Move  to  pile? "
  to=gets.chomp
  case n
  when '1'
    if !drawpile_1.empty?
      playpile_5 << drawpile_1.shift
    end
  when '2'
    if !drawpile_2.empty?
      playpile_6 << drawpile_2.shift
    end
  when '3'
    if !drawpile_3.empty?
      playpile_7 << drawpile_3.shift
    end
  when '4'
    if !drawpile_4.empty?
      playpile_8 << drawpile_4.shift
    end
  when '5'
    if !playpile_6.empty? && (playpile_5[-1] = playpile_6[0] || playpile_5[-1] = playpile_6[0]-1 || playpile_5[-1] = playpile_6[0]+1)
      playpile_5 << playpile_6
      playpile_6 = []
    end
  end
  show_board(drawpile_1,drawpile_2,drawpile_3,drawpile_4,playpile_5,playpile_6,playpile_7,playpile_8)
end

puts "  YOU WIN!"