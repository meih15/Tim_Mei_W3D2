require "byebug"
require_relative "card"


class Board

    # def self.make_cards
    #     (0..card_num/2).each do |ele|
    #         @cards << [Card.new(ele, "face-down"), Card.new(ele, "face-down")]
    #     end 
    # end 

    def initialize(card_num) #16
        @size = Math.sqrt(card_num) 
        @grid = Array.new (@size){ Array.new (@size)}
        @cards = []
        @card_num = card_num
    end


    def make_cards
        (0..@card_num/2).each do |ele|
            @cards << [Card.new(ele, "face-down"), Card.new(ele, "face-down")]
        end 
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

    def [](pos)
        row, col = pos
        @grid[row][col]
    end 

    def []=(pos, value)
        row, col = pos
        @grid[row][col] = value
    end


    def reveal(pos) 
        if self[pos].face == "face-down"
            self[pos].reveal
            return self[pos].display_information

        end
     
    end


    def won?
        @grid.each do |subArr|
            subArr.each { |ele| return false if ele.face == "face-down"} 
            debugger
        end

    true
    end 



end


