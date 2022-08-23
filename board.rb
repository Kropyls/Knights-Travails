# frozen_string_literal: true

# Board class to hold all pieces in play
class Board
  attr_reader :board_as_array
  def initialize
    @board_as_array = Array.new(8) { Array.new(8, nil) }
  end

  def accessor(position)
    @board_as_array[position[1]][position[0]]
  end

  def add_piece(piece, position)
    @board_as_array[position[1]][position[0]] = piece
    piece.position = position
  end

  def remove_piece(position)
    @board_as_array[position[1]][position[0]]&.positon = nil
    @board_as_array[position[1]][position[0]] = nil
  end

  # below is to help visualize the game board
  def print_board(board = @board_as_array)
    print_line
    board.map do |row|
      row.map { |square| print(square.nil? ? '|   ' : "| #{square.print} ") }
      print '|'
      print_line
    end
    print "\n"
  end

  def print_line
    print "\n---------------------------------\n"
  end
end
