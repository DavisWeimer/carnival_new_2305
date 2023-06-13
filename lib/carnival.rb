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

  def most_popular_ride
    top_ride = @rides.find do |ride|
      times_rode = ride.rider_log.values
      times_rode.max {|a,b| a[1] <=> b[1]}
    end
    top_ride.name
  end

  def most_profitable_ride
    @rides.max_by(&:total_revenue).name
  end

  def total_revenue
    @rides.sum(&:total_revenue)
  end

  def summary
    # need some more time for this!
    hash = Hash.new
    hash[:visitor_count] = @rides.sum {|ride| ride.rider_log.uniq}
    require 'pry'; binding.pry
    hash[:revenue_earned] = 
    @rides.each do |ride|
      require 'pry'; binding.pry
    end
  end
end