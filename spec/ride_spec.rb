require 'spec_helper'

RSpec.describe Ride do
  before(:each) do
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
  end

  describe 'class' do
    it 'exists' do
      expect(@ride1).to be_a(Ride)
      expect(@ride1.name).to eq("Carousel")
      expect(@ride1.min_height).to eq(24)
      expect(@ride1.admission_fee).to eq(1)
      expect(@ride1.excitement).to eq(:gentle)
    end
  end

  describe '#total_revenue' do
    it 'checks acumulated earnings from visitors starting at 0' do
      expect(@ride1.total_revenue).to eq(0)
    end
  end
end