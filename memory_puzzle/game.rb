require_relative "board"
require_relative "card"

class Game

    def initialize
        @board = Board.new(16)
        @guessed_pos = []
        @previous_guess = []
    end


    def get_pos
        p "Please enter position greater or equal to '0 0' and less than '4 4'"
        input = gets.chomp.split.map(&:to_i)
    end


    def play 
    @board.make_cards
    @board.populate
    p @board.grid
    while @board.won? == false
        @board.render
        @guessed_pos = self.get_pos

        if @previous_guess.empty?
            @previous_guess = @guessed_pos
        else
            pos1 = @guessed_pos
            pos2 = @previous_guess
            if @board[pos1].value  == @board[pos2].value
                @board[pos1].reveal_card && @board[pos2].reveal_card
                @board.hidden_grid[pos1[0]][pos1[1]] =  @board[pos1].value && @board.hidden_grid[pos2[0]][pos2[1]] = @board[pos2].value
                p 'You got a match!'
            else  
                @board.hidden_grid[pos1[0]][pos1[1]] = @board[pos1].value 
                @board.hidden_grid[pos2[0]][pos2[1]] = @board[pos2].value
                @board.render
                p 'Try again'
                @board.hidden_grid[pos1[0]][pos1[1]] = :H
                @board.hidden_grid[pos2[0]][pos2[1]] = :H
            end
            @previous_guess = []
           
        end
    end 
    p 'Gameover, you win!'
    end

end