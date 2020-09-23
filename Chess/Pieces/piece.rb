class Piece
    attr_reader :board, :color 
    attr_accessor :pos
    def initialize(board, color, pos=nil)
        @board = board
        @color = color
        @pos = pos
    end

    def to_s
        " #{symbol} "
    end

    def symbol
        raise NotImplementedError
    end

end
