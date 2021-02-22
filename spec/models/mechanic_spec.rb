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

  it "class methods" do
    Ride.destroy_all
    dominic = Mechanic.create!(name: "Dominic", years_experience: 10)
    tilta_whirl = dominic.rides.create(name: "Tilt a Whirl", thrill_rating: 7, open:true)
    roller_coaster = dominic.rides.create(name: "Roller Coaster", thrill_rating: 5, open:false)
    tea_cups = dominic.rides.create(name: "Tea cups", thrill_rating: 9, open:true)
    expect(dominic.open_rides).to eq([tea_cups, tilta_whirl])
  end
end
