require_relative 'cards.rb'
require_relative 'func.rb'

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