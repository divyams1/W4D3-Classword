require_relative "piece"

class Pawn < Piece


    def symbol
        '♙'.colorize(color)
    end

    def moves
        foward_steps + side_attacks
    end


    # private
    def foward_dir
       if color == :black
            1
       else
            -1
       end 
    end

    def at_start_row?
        if color == :black && pos[0] == 1
            return true
        end
        
        if color == :white && pos[0] == 6
            return true
        end
        false
    end

    def foward_steps
        row, col = pos 
        one_step = [row + foward_dir, col]
        return [] if board[one_step] != nil #|| !board.valid_pos?(one_step)    
        moves = [one_step]
        two_steps = [row + 2 * foward_dir, col]
        moves << two_steps if at_start_row? && board[two_steps] == nil
        moves
    end

    def side_attacks
        row, col = pos
        moves = [] 
        
        left_attack = [row + foward_dir, col -1]
        right_attack = [row + foward_dir, col + 1]
        moves << left_attack if board[left_attack] != nil 
        moves << right_attack if board[right_attack] != nil 
        moves 
        # side_steps = [[row + foward_dir, col -1] ,[row + foward_dir, col + 1]]
    end


    #if its the first move a pawn made, it can go [0,1] or [0,2]
    #after first move it can only move [0,1]
    #if there is a peice that is at [1,1] or [-1,1] of the pawn it can move their to capture it.
end