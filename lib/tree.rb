# frozen_string_literal: true

require_relative 'node'

# Balanced Binary Search Tree
class Tree
  def initialize(arr)
    @root = build_tree(arr)
  end
end
