require 'pry'

class Visitor
  attr_accessor :spending_money
  attr_reader :name,
              :height,
              :preferences
  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_money.delete('$').to_i
    @preferences = []
  end

  def add_preference(pref)
    @preferences.push(pref)
  end

  def tall_enough?(height_req)
    @height >= height_req
  end
end