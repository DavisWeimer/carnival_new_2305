require 'pry'

class Visitor
  attr_reader :name,
              :height,
              :spending_money
  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_money
  end
end