class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement,
              :total_revenue,
              :rider_log
  def initialize(ride)
    @name = ride[:name]
    @min_height = ride[:min_height]
    @admission_fee = ride[:admission_fee]
    @excitement = ride[:excitement]
    @total_revenue = 0
    @rider_log = Hash.new(0)
  end

  def board_rider(visitor)
    if rider_eligible?(visitor) 
      if visitor.preferences.find {|pref| pref == excitement} 
        @total_revenue += @admission_fee
        visitor.spending_money -= @admission_fee
        @rider_log[visitor] += 1
      end
    end
  end

  def rider_eligible?(visitor)
    visitor.spending_money - @admission_fee >= 0 && visitor.height >= @min_height
  end
end