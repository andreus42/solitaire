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