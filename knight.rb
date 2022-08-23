# frozen_string_literal: true

# Knight class should hold all features specific to the piece
class Knight
  attr_accessor :position

  def initialize
    @position = nil
  end

  def print
    'K'
  end

  def move_options(start = @position)
    raise 'Error: starting off board dimensions.' unless start.all? { |coodinate| coodinate.between?(0, 7) }

    options = []
    moves = [1, 2], [1, -2], [2, 1], [2, -1], [-1, 2], [-1, -2], [-2, 1], [-2, -1]
    moves.each do |x, y|
      option = [start[0] + x, start[1] + y]
      options.push(option) if option.all? { |coodinate| coodinate.between?(0, 7) }
    end
    options
  end

  def knight_moves(start, destination) end
end
