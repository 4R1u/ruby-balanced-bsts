# frozen_string_literal: true

# represents a node/branch in a tree
class Node
  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end
