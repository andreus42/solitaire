require_relative 'cards.rb'
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
# def move_pile(play1, play2)
#   if play2.empty?
#     play2.concat(play1)
#     play1.clear
#   elsif (within_one(play1[0].rank.to_i, play2[-1].rank.to_i) && (within_one(play1[0].rank.to_i, play2[-1].rank.to_i)))
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
#   elsif (within_one(play1[0].rank.to_i, play2[-1].rank.to_i))
#       play1.concat(play2)
#       play1.clear
#   elsif (within_one(play1[0].rank.to_i, play2[0].rank.to_i))
#       play1.concat(play2)
#       play1.clear
#   else
#   end
# end

# Experimental
def move_pile(play1, play2)
  if play2.empty?
    play2.concat(play1)
    play1.clear
  elsif (within_one(play1[0].rank.to_i, play2[-1].rank.to_i))
    play2.concat(play1)
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

# card1 = Card.new(14, "S")
# card2 = Card.new(14, "H")
# card3 = Card.new(13, "D")
# card4 = Card.new(13, "C")
# color_print(card1)
# color_print(card2)
# deck = [card1, card2, card3, card4]
# deck.each { |card| color_print(card) }
  
