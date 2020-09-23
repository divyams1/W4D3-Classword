require_relative "Pieces"
require "colorize"
class Board
    attr_reader :board
    def initialize
        board = Array.new(8) {Array.new(8, "i")}
        @board = board
        
        place_pieces
    end

    def place_pieces
        @board[1].map! { |square| Pawn.new(:pawn, :black) }
        @board[6].map! {|square| Pawn.new(:pawn, :white)}
        @board[0][0] = Rook.new(@board, :black)
        @board[0][7] = Rook.new(@board, :black)
        @board[0][1] = Knight.new(:knight, :black)
        @board[0][6] = Knight.new(:knight, :black)
        @board[0][5] = Bishop.new(:bishop, :black)
        @board[0][2] = Bishop.new(:bishop, :black)
        @board[0][3] = Queen.new(:queen, :black)
        @board[0][4] = King.new(:king, :black)
       
        @board[7][0] = Rook.new(@board, :white)
        @board[7][7] = Rook.new(@board, :white)
        @board[7][1] = Knight.new(:knight, :white)
        @board[7][6] = Knight.new(:knight, :white)
        @board[7][5] = Bishop.new(:bishop, :white)
        @board[7][2] = Bishop.new(:bishop, :white)
        @board[7][3] = Queen.new(:queen, :white)
        @board[7][4] = King.new(:king, :white)
    end
    
    def place_positions
        @board[0].each_with_index { |piece, ind| piece.pos = [0, ind] }  
        @board[1].each_with_index { |piece, ind| piece.pos = [1, ind] }  
        @board[6].each_with_index { |piece, ind| piece.pos = [6, ind] }  
        @board[7].each_with_index { |piece, ind| piece.pos = [7, ind] } 
    end

    
    def [](pos)
        raise "invalid pos" unless valid_pos?(pos)
        row, col = pos
        @board[row][col]
    end
    
    def []=(pos, piece)
        row, col = pos
        @board[row][col] = piece
    end
    
    def empty?(pos)
        self[pos].empty?
    end

    def valid_pos?(pos)
       pos.all? {|coordinate| coordinate.between?(0,7) }
    end

    def move_piece(start_pos, end_pos)
        if !self[start_pos].nil? && valid_pos?(end_pos)
            piece = self[start_pos]
            self[end_pos] = piece
            self[end_pos].pos = end_pos
            self[start_pos] = nil
        end 
    end

    def print 
        @board.each do |row|
            p row.join(" ")
        end 
    end
    
end

# a = Board.new #Array.new(8) {Array.new(8, [])}
# puts a.board
# a = Board.new 
# a.board[0][0] = Rook.new(a.board, :black)
# b = a.board[0][0]
# b.pos = [0,0]