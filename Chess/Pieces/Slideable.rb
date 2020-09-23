require "byebug"
module Slideable 
    VERTICAL_HORIZONTAL_MOVES= [
         [0,1], 
         [0,-1], 
         [-1,0], 
         [1,0] 
        ]
    
    DIAGONAL_MOVES = [ 
        [1,1],
        [1,-1], 
        [-1,-1],
        [-1, 1] 
    ]


    def vertical_dirs 
        VERTICAL_HORIZONTAL_MOVES
    end

    def diagnol_dirs 
        DIAGONAL_MOVES
    end
    
    def moves
        moves = []
        possible_moves = move_dirs
        possible_moves.each do |move|
            dx, dy = move
           moves += grow_unblocked_moves_in_dir(dx, dy)
        end 
            
        moves
    end
    
    # break if self.board[row][col] != nil
    private 
    
    def move_dirs 
        raise NotImplementedError
    end 
    
    def grow_unblocked_moves_in_dir(dx, dy)           
        row, col = pos
        moves = []
        new_pos = [row, col]
       while board.valid_pos?(new_pos) 
            new_x = new_pos[0] + dx 
            new_y = new_pos[1] + dy 
            new_pos = [new_x, new_y] 
            break if !board.valid_pos?(new_pos)
            break if self.board[new_pos] != nil && board[new_pos].color == color
            moves << new_pos if board.valid_pos?(new_pos)
            break if board[new_pos] != nil && board[new_pos].color != color 
       end

        moves
    end
   
end 


# > a = Board.new
# => #<Board:0x00007fffca6118f0
#  @board=
#   [[nil, nil, nil, nil, nil, nil, nil, nil],
#    [nil, nil, nil, nil, nil, nil, nil, nil],
#    [nil, nil, nil, nil, nil, nil, nil, nil],
#    [nil, nil, nil, nil, nil, nil, nil, nil],
#    [nil, nil, nil, nil, nil, nil, nil, nil],
#    [nil, nil, nil, nil, nil, nil, nil, nil],
#    [nil, nil, nil, nil, nil, nil, nil, nil],
#    [nil, nil, nil, nil, nil, nil, nil, nil]]>
# [4] pry(main)>

# @board=
# [[#<Rook:0x00007fffee5fc468 ...>, nil, nil, nil, nil, nil, nil, nil],
#  [nil, nil, nil, nil, nil, nil, nil, nil],
#  [nil, nil, nil, nil, nil, nil, nil, nil],
#  [nil, nil, nil, nil, nil, nil, nil, nil],
#  [nil, nil, nil, nil, nil, nil, nil, nil],
#  [nil, nil, nil, nil, nil, nil, nil, nil],
#  [nil, nil, nil, nil, nil, nil, nil, nil],
#  [nil, nil, nil, nil, nil, nil, nil, nil]],


 # dont move if its our color
    # dont mpove if its outside board
    # dont stop moving if its their color
    # take piece

      # queen.include horizontal_moves && DIAGONAL_MOVES
    # def horizontal_moves(pos)
    #     moves = []
    #     row, col = pos
    #     (col..7).each do |idx| 
    #         break if @board[row][idx] != nil
    #         moves << [row, idx] 
    #     end   
    #     (0...col).each do |i| 
    #         break if @board[row][i] != nil
    #         moves << [row, i]
    #     end             
    #     moves
    # end

    # def vertical(pos)
    #     moves = []
    #     row, col = pos
    #     (row..7).each do |idx| 
    #         break if @board[idx][col] != nil
    #         moves << [idx, col] 
    #     end   
    #     (0...row).each do |i| 
    #         break if @board[idx][col] != nil
    #         moves << [idx, col]
    #     end             
    #     moves
    # end
    
       