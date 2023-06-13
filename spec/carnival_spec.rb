require 'spec_helper'

RSpec.describe Carnival do
  before(:each) do
    @carnival = Carnival.new(14)
    
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')

    @visitor1.add_preference(:gentle)
    @visitor2.add_preference(:gentle)
    @visitor2.add_preference(:thrilling)
    @visitor3.add_preference(:thrilling)
  end

  describe 'class' do
    it 'exists' do
      expect(@carnival).to be_a(Carnival)
      expect(@carnival.duration).to eq(14)
      expect(@carnival.rides).to eq([])
    end
  end

  describe '#add_rides()' do
    it 'can add ride to Carnival' do
      @carnival.add_ride(@ride1)
      @carnival.add_ride(@ride2)
      @carnival.add_ride(@ride3)

      expect(@carnival.rides).to eq([@ride1, @ride2, @ride3])
    end
  end

  describe '#most_popular_ride' do
    xit 'returns name of the most popular ride' do
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor3) # $15 left, not into it
      @ride1.board_rider(@visitor1) # $8 left
      @ride1.board_rider(@visitor2) # $3 left
      
      @ride2.board_rider(@visitor2) # $3, not enough.. bummer Tucker
      @ride2.board_rider(@visitor3) # $15 left, not into this one either..
      @ride2.board_rider(@visitor1) # $3 left
      @ride3.board_rider(@visitor1) # $3, not enough.. bummer Bruce

      @ride3.board_rider(@visitor2) # not tall enough or enough money.. bummer Tucker
      @ride3.board_rider(@visitor3) # $13 left
      @ride3.board_rider(@visitor1) # $1, not enough.. bummer Penny
      
      expect(@visitor1.spending_money).to eq(3)
      expect(@visitor2.spending_money).to eq(3)
      expect(@visitor3.spending_money).to eq(13)
      expect(@carnival.most_popular_ride).to eq("Carousel")
    end
  end
end