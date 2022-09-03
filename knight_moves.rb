class Node
  attr_accessor :position, :parent

  @@history = []
  MOVES = [[1, 2], [1, -2], [2, 1], [2, -1], [-1, 2], [-1, -2], [-2, 1], [-2, -1]].freeze

  def initialize(parent, child)
    @parent = parent
    @child = child
    @@history.push(@parent)
  end

  def valid?(position)
    true if position[0].between?(1, 8) && position[1].between?(1, 8)
  end

  def tree_maker(_root)
    possible_moves = MOVES.map { |move| [@parent[0] + move[0], @parentp[1] + move[1]] }
    possible_moves.keep_if { |position| position.valid? }
    possible_moves.reject { |e| @@history.include?(e) }
    possible_moves.map { |e| Node.new(self, e) }
  end

  def display_parent(node)
    display_parent(node.parent) unless node.parent.nil?
    p node.child + ' '
  end
end

  def knight_moves(start_position, end_position)
    queue = []
    current_node = Node.new(nil, start_position)
    until current_node.child == end_position
      current_node.tree_maker.each { |child| queue.push(child) }
      current_node = queue.shift
    end
    display_parent(current_node)
  end

knight_moves([1, 1], [8, 8])
