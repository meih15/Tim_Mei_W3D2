require_relative "card"


class Board

    # def self.make_cards
    #     (0..card_num/2).each do |ele|
    #         @cards << [Card.new(ele, "face-down"), Card.new(ele, "face-down")]
    #     end 
    # end 

    def initialize(card_num) #16
        @size = Math.sqrt(card_num) 
        @grid = Array.new (@size) { Array.new (@size)}
        @cards = []
        @card_num = card_num
        @hidden_grid = hidden = Array.new(@size){ Array.new (@size, :H) }
    end

    attr_reader :cards, :grid, :hidden_grid

    def make_cards
        (0...@card_num/2).each do |ele|
            @cards << [Card.new(ele, "face-down"), Card.new(ele, "face-down")]
        end 
    end 
    
    def populate
        random_cards = @cards.flatten.shuffle
        i = 0 
        while i < @size * @size 
            @grid.each_with_index do |subArr, idx| # [[], [], []]
                subArr.each_index do |idx2|
                    pos = [idx, idx2]
                    self[pos] = random_cards[i]
                    i += 1 
                end 
            end
        end 
    end 


    def render
        @hidden_grid.each do |subarr|
            print subarr
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
           
        end

    true
    end 

end


