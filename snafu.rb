puts "Directions:"
puts "The goal is to place every card from piles A-D into a row."
puts""
puts"A card from pile A-D can be placed on a card in row 1-4 if they are within 1 of each other."
puts "To do this, use a command like B4."
puts""
puts "An entire row can be placed on another row if adjacent cards are within 1 of each other."
puts "To do this, use a command like 23."
puts""
puts "Type 00 to quit."

deck=["2","2","2","2","3","3","3","3","4","4","4","4","5","5","5","5","6","6","6","6","7","7","7","7","8","8","8","8","9","9","9","9","10","10","10","10","J","J","J","J","Q","Q","Q","Q","K","K","K","K","A","A","A","A"]

deck=deck.shuffle

pileA=deck.take(13)
pileB=deck.drop(13).take(13)
pileC=deck.drop(26).take(13)
pileD=deck.drop(39)

pile1=[pileA.pop]
pile2=[pileB.pop]
pile3=[pileC.pop]
pile4=[pileD.pop]

#checks if a move can be done
def legal_check(a,b) 
  legal=["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
  
  if b==nil # || b==nil (i think this works)
    puts "Invalid move!"
    return false
  elsif (b=="1" || b=="2" || b=="3" || b=="4") && a==nil #doesnt work
    return true #doesnt work
  elsif (legal.index(a)-legal.index(b)).abs<=1
    return true
  elsif a=="2" && b=="A"
    return true
  elsif a=="A" && b=="2"
    return true
  else
    puts "Illegal move!"
    return false
  end
end

#displays the game state A-D,1-4
def game_display(a,b,c,d,e,f,g,h) 
  if a.last == "10"
    print "#{a.last} <A 1> "
  else
    print " #{a.last} <A 1> "
  end
  e.each { |x| print x.to_s+" "}
  puts ""
  if b.last == "10"
    print "#{b.last} <B 2> "
  else
    print " #{b.last} <B 2> "
  end
  f.each { |x| print x.to_s+" "}
  puts ""
  if c.last == "10"
    print "#{c.last} <C 3> "
  else
    print " #{c.last} <C 3> "
  end
  g.each { |x| print x.to_s+" "}
  puts ""
  if d.last == "10"
    print "#{d.last} <D 4> "
  else
    print " #{d.last} <D 4> "
  end
  h.each { |x| print x.to_s+" "}
  puts ""
end

win=0

while win==0 

puts ""
game_display(pileA,pileB,pileC,pileD,pile1,pile2,pile3,pile4)  
  
print "Move: "
m=gets.chomp
a=m[0]
b=m[1]


if a=="1" && b=="2"
  if legal_check(pile2.last,pile1[0])==true
    pile2 += pile1
    pile1=nil
  end
elsif a=="1" && b=="3"
  if legal_check(pile3.last,pile1[0])==true
    pile3 += pile1
    pile1=nil
  end
elsif a=="1" && b=="4"
  if legal_check(pile4.last,pile1[0])==true
    pile4 += pile1
    pile1=nil
  end
elsif a=="2" && b=="1"
  if legal_check(pile1.last,pile2[0])==true
    pile1 += pile2
    pile2=nil
  end
elsif a=="2" && b=="3"
   if legal_check(pile3.last,pile2[0])==true
    pile3 += pile2
    pile2=nil
  end
elsif a=="2" && b=="4"
   if legal_check(pile4.last,pile2[0])==true
    pile4 += pile2
    pile2=nil
  end
elsif a=="3" && b=="1"
  if legal_check(pile1.last,pile3[0])==true
    pile1 += pile3
    pile3=nil
  end
elsif a=="3" && b=="2"
  if legal_check(pile2.last,pile3[0])==true
    pile2 += pile3
    pile3=nil
  end
elsif a=="3" && b=="4"
  if legal_check(pile4.last,pile3[0])==true
    pile4 += pile3
    pile3=nil
  end
elsif a=="4" && b=="1"
  if legal_check(pile1.last,pile4[0])==true
    pile1 += pile4
    pile4=nil
  end
elsif a=="4" && b=="2"
  if legal_check(pile2.last,pile4[0])==true
    pile2 += pile4
    pile4=nil
  end
elsif a=="4" && b=="3"
  if legal_check(pile3.last,pile4[0])==true
    pile3 += pile4
    pile4=nil
  end
elsif a.upcase=="A" && b=="1"
   if legal_check(pileA.last,pile1.last)==true
    pile1 += [pileA.pop]
  end
elsif a.upcase=="A" && b=="2"
  if legal_check(pileA.last,pile2.last)==true
    pile2 += [pileA.pop]
  end
elsif a.upcase=="A" && b=="3"
  if legal_check(pileA.last,pile3.last)==true
    pile3 += [pileA.pop]
  end
elsif a.upcase=="A" && b=="4"
  if legal_check(pileA.last,pile4.last)==true
    pile4 += [pileA.pop]
  end
elsif a.upcase=="B" && b=="1"
  if legal_check(pileB.last,pile1.last)==true
    pile1 += [pileB.pop]
  end
elsif a.upcase=="B" && b=="2"
  if legal_check(pileB.last,pile2.last)==true
    pile2 += [pileB.pop]
  end
elsif a.upcase=="B" && b=="3"
  if legal_check(pileB.last,pile3.last)==true
    pile3 += [pileB.pop]
  end
elsif a.upcase=="B" && b=="4"
  if legal_check(pileB.last,pile4.last)==true
    pile4 += [pileB.pop]
  end
elsif a.upcase=="C" && b=="1"
  if legal_check(pileC.last,pile1.last)==true
    pile1 += [pileC.pop]
  end
elsif a.upcase=="C" && b=="2"
  if legal_check(pileC.last,pile2.last)==true
    pile2 += [pileC.pop]
  end
elsif a.upcase=="C" && b=="3"
  if legal_check(pileC.last,pile3.last)==true
    pile3 += [pileC.pop]
  end
elsif a.upcase=="C" && b=="4"
  if legal_check(pileC.last,pile4.last)==true
    pile4 += [pileC.pop]
  end
elsif a.upcase=="D" && b=="1"
  if legal_check(pileD.last,pile1.last)==true
    pile1 += [pileD.pop]
  end
elsif a.upcase=="D" && b=="2"
  if legal_check(pileD.last,pile2.last)==true
    pile2 += [pileD.pop]
  end
elsif a.upcase=="D" && b=="3"
  if legal_check(pileD.last,pile3.last)==true
    pile3 += [pileD.pop]
  end
elsif a.upcase=="D" && b=="4"
  if legal_check(pileD.last,pile4.last)==true
    pile4 += [pileD.pop]
  end
elsif a=="0" && b=="0" ##type 00 to quit
 win=-1
else
  puts "Invalid command! Type 00 if you want to quit."
end

#row replacer
if pile1==nil && pileA != nil
  pile1=[pileA.pop]
elsif pile2==nil && pileB != nil
  pile2=[pileB.pop]
elsif pile3==nil && pileC != nil
  pile3=[pileC.pop]
elsif pile4==nil && pileD != nil
  pile4=[pileD.pop]
end

pile1=pile1.compact
pile2=pile2.compact 
pile3=pile3.compact
pile4=pile4.compact
  
#victory checker(not working)
if pileA==nil && pileB==nil && pileC==nil && pileD==nil
  puts "Congratulations! You won!"
  win=1
end
  
#defeat checker
  #need to write

end  #end while loop