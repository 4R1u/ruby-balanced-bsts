# frozen_string_literal: true

# represents a node/branch in a tree
class Node
  attr_accessor :data, :left, :right

  include Comparable

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def <=>(other)
    data <=> other.data
  end

  def leaf?
    left.nil? && right.nil?
  end
end
