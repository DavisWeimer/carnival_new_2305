require 'spec_helper'

RSpec.describe Ride do
  before(:each) do
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
  end

  describe 'class' do
    it 'exists' do
      expect(@ride1).to be_a(Ride)
    end
  end
end