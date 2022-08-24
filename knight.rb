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

  def knight_moves(destination, start = position)
    dest_as_node = find_destination_node(destination, start)
    path = []
    until dest_as_node.nil?
      path.unshift(dest_as_node.position)
      dest_as_node = dest_as_node&.parent
    end
    puts "You've made it in #{path.count} moves! Path is:\n"
    path.each { |coodinate| p coodinate }
  end

  private

  def move_options(start = position)
    raise 'Error: starting off board dimensions.' unless start.all? { |coodinate| coodinate.between?(0, 7) }

    options = []
    moves = [1, 2], [1, -2], [2, 1], [2, -1], [-1, 2], [-1, -2], [-2, 1], [-2, -1]
    moves.each do |x, y|
      option = [start[0] + x, start[1] + y]
      options.push(option) if option.all? { |coodinate| coodinate.between?(0, 7) }
    end
    options
  end

  def find_destination_node(destination, start)
    queue = Queue.new
    queue.push(PositionAndOptions.new(start))
    until queue.empty?
      node = queue.pop
      return node if node.position == destination

      move_options(node.position)
        .map { |opt| PositionAndOptions.new(opt, node) }
        .each { |child| queue.push(child) }
    end
    raise "Fault: find_destination_node failed with: start: #{start} and destination: #{destination}."
  end
end

# tracks current positon and options in a tree like state
class PositionAndOptions
  attr_accessor :position, :parent

  def initialize(position, parent = nil)
    @position = position
    @parent = parent
  end
end
