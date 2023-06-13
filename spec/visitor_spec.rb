require 'spec_helper'

RSpec.describe Visitor do
  before(:each) do
    @visitor1 = Visitor.new('Bruce', 54, '$10')
  end

  describe 'class' do
    it 'exists' do
      expect(@visitor1).to be_a(Visitor)
      expect(@visitor1.name).to eq("Bruce")
      expect(@visitor1.height).to eq(54)
      expect(@visitor1.spending_money).to eq('$10')
    end
  end

  describe '#preferences' do
    it 'starts as an empty array' do
      expect(@visitor1.preferences).to eq([])
    end
  end

  describe '#add_preference()' do
    it 'can add preferences as symbols to visitor' do
      @visitor1.add_preference(:gentle)
      @visitor1.add_preference(:thrilling)
      expect(@visitor1.preferences).to eq([:gentle, :thrilling])
    end
  end
end