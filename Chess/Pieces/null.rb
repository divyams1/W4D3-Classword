require "singleton"
require_relative "piece"

class NullPiece < Piece
    attr_reader :name
    include Singleton
    def initialize
        @name = " "
        @color = :none
    end

    def empty?
        true
    end

    def moves
        []
    end

end
