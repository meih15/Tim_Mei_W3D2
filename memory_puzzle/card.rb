class Card

    def initialize(value, face)
        @value = value
        @face = face
    end

    def [](pos)
        
    end 

    def display_information
        # if @face == "face-up"
        #     return @value
        # end

        @face
        @value
    end

    def hide
        @face = "face-down"
    end

    def reveal(pos) 
        if self[pos[0][pos[1]
    end

    

end