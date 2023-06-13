class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement
  def initialize(ride)
    @name = ride[:name]
    @min_height = ride[:min_height]
    @admission_fee = ride[:admission_fee]
    @excitement = ride[:excitement]
  end
end