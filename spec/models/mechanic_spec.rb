require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many :mechanic_rides }
    it { should have_many(:rides).through(:mechanic_rides) }
  end

  describe "class methods" do
    it "should find the average across all mechanics" do
      dominic = Mechanic.create!(name: "Dominic", years_experience: 10)
      ronny = Mechanic.create!(name: "Ronny", years_experience: 5)
      leroy = Mechanic.create!(name: "Leroy", years_experience: 15)
      expect(Mechanic.average_experience).to be(10.0)

    end
  end
end
