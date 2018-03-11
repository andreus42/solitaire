# require 'pp' #=> pretty print

card0 = Card.new(2, "S")
my_deck.shuffle!
puts "Count: #{my_deck.count}"
puts "My deck deal: #{my_deck.deal}"

while my_deck.count > 0 do
  puts "#{my_deck.count%4} #{my_deck.deal}"
end

#loop with popping
@i = 0
while (!pile.empty?)
  @i+=1
  puts "Popped Card #{@i}: #{pile.pop()}"
end
puts "Count: #{my_deck.count}"

# original combine
  when 'C'
    puts "While pile do you want to combine?"
    n=gets.chomp
    case n
      when '1'
        playpile_1 = playpile_1 + playpile_2
        playpile_2 = []
      when '2'  
        playpile_2 = playpile_2 + playpile_3
        playpile_3 = []
      when '3'
        playpile_3 = playpile_3 + playpile_4
        playpile_4 = []
      when '4'
        playpile_4 = playpile_4 + playpile_1
        playpile_1 = []
    end