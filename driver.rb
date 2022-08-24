# frozen_string_literal: true

require_relative './knight'
require_relative './board'

board = Board.new
board.add_piece(Knight.new, [6, 4])
board.print_board

knight = board.accessor([6, 4])

knight.knight_moves([6, 4], [7, 5])
