# frozen_string_literal: true

require_relative 'node'

# Balanced Binary Search Tree
class Tree
  def initialize(arr)
    @root = build_tree(arr.uniq.sort)
  end

  def build_tree(arr)
    return Node.new arr[0] if arr.length <= 1

    mid = arr.length / 2
    root = Node.new arr[mid]

    root.left = build_tree(arr[..mid - 1])
    root.right = build_tree(arr[mid + 1..])
    root
  end
end
