require "colorize"
require_relative "cursor"
require_relative "board"

class Display

    attr_reader :board, :cursor

    def initialize(board)
        @board = board 
        @cursor = Cursor.new([0,0], board)
    end

    def render
        board.print 
        cursor.get_input
    end 

    def change_color_for(i, j)
        if cursor.cursor_pos == [i, j]
            board[i,j].colorize(:red)
        elsif (i + j).odd?
            board[i, j].colorize(:blue)
        else
            board[i , j].colorize(:green)
        end 
    end

    def make_moves 
        selected = true 
        while selected 
            render 
            
        end 

    end
end