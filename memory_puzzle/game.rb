require_relative "board"
require_relative "card"

class Game

    def initialize
        @board = Board.new()
        @guessed_pos = []
        @previous_guess = []
    end

    def get_pos
        p "Please enter position"
        input = gets.chomp.split.map(&:to_i)
    end

    def play 
        @board.render
        @guessed_pos = self.get_pos

        if @previous_guess.empty?
            @previous_guess = @guessed_pos
        else
            pos1 = @guessed_pos
            pos2 = @previous_guess
            if @board.reveal(pos1) == @board.reveal(pos2)
                @board[pos1].reveal && @board[pos2].reveal
            end
            @previous_guess = []
        end
    end

end