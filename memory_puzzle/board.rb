require_relative "Card"

class Board

    def initialize(card_num) #16
        @size = Math.sqrt(card_num) 
        @grid = Array.new (@size){ Array.new (@size)}
        @cards = []
    end

    
    def populate
        random_cards = @cards.shuffle
        i = 0 
        while i < @size * @size 
            @grid.each do |subArr| # [[], [], []]
                subArr.each do |ele|
                    ele = random_cards[i]
                    i += 1 
                end 
            end
        end 
    end 


    def render
        @grid.each do |subarr|
            p subarr
        end 
    end 


    def won?
        @cards.reveal
    end 

end


