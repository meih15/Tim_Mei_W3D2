class Card

    def initialize(value, face)
        @value = value
        @face = face
    end

    attr_reader :face, :value

 
    def display_information
        if @face == "face-up"
            return @value
        end
    end

    def hide
        @face = "face-down"
    end

    def reveal_card
        @face = "face-up"
    end


end