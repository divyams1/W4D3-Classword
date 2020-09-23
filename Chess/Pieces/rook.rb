require_relative "piece"
require_relative "Slideable"
class Rook < Piece
    include Slideable
    
    def symbol
        '♖'.colorize(color)
    end


    def move_dirs
        vertical_dirs 
    end
    
end