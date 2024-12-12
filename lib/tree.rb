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

  def delete(value, root = @root)
    return if root.nil?

    if root.data > value
      root.left = delete(value, root.left)
    elsif root.data < value
      root.right = delete(value, root.right)
    else
      return root.right if root.left.nil?
      return root.left if root.right.nil?

      successor = successor_in_right_subtree(root)
      root.data = successor.data
      root.right = delete(successor.data, root.right)
    end
    root
  end

  def find(value)
    node = @root
    node = node.data > value ? node.left : node.right until node.nil? || node.data == value
    node
  end

  def level_order
    queue = []
    queue.push(@root)
    until queue.empty?
      yield(queue[0].data)
      queue << queue[0].left if queue[0].left
      queue << queue[0].right if queue[0].right
      queue.delete_at 0
    end
  end

  private

  def successor_in_right_subtree(node)
    node = node.right
    node = node.left while !node.nil? && !node.left.nil?
    node
  end
end
