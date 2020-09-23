require_relative "piece"
require_relative "Slideable"
class Bishop < Piece
    include Slideable

    def symbol
        '♗'.colorize(color)
    end

    def move_dirs
        diagnol_dirs  
    end
    
end