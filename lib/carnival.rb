class Carnival
  attr_reader :duration,
              :rides
  def initialize(duration)
    @duration = duration
    @rides = Array.new
  end

  def add_ride(ride)
    @rides.push(ride)
  end
end