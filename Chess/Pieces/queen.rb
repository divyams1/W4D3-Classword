require_relative "piece"
require_relative "Slideable"
class Queen < Piece
    include Slideable

    def symbol
        '♕'.colorize(color)
    end

    def move_dirs
        vertical_dirs + diagnol_dirs  
    end
    
end