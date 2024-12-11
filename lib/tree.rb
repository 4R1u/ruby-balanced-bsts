# frozen_string_literal: true

require_relative 'node'

# Balanced Binary Search Tree
class Tree
  def initialize(arr)
    @root = build_tree(arr.uniq.sort)
  end

  def build_tree(arr)
    return nil if arr.empty?
    return Node.new arr[0] if arr.length == 1

    mid = arr.length / 2
    root = Node.new arr[mid]

    root.left = build_tree(arr[..mid - 1])
    root.right = build_tree(arr[mid + 1..])
    root
  end

  def pretty_print(node = @root, prefix = '', is_left: true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", is_left: false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", is_left: true) if node.left
  end

  def insert(value, root = @root)
    return root if value == root.data

    if value < root.data
      return root.left = Node.new(value) if root.left.nil?

      insert(value, root.left)
    else
      return root.right = Node.new(value) if root.right.nil?

      insert(value, root.right)
    end
  end
end
