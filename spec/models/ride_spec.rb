
require 'rails_helper'

RSpec.describe Ride, type: :model do
  describe 'relationships' do
    it { should have_many :mechanic_rides }
    it { should have_many(:mechanics).through(:mechanic_rides) }
  end

  it "class methods" do
    Ride.destroy_all
    tilta_whirl = Ride.create(name: "Tilt a Whirl", thrill_rating: 7, open:true)
    roller_coaster = Ride.create(name: "Roller Coaster", thrill_rating: 5, open:false)
    tea_cups = Ride.create(name: "Tea cups", thrill_rating: 9, open:true)
    expect(Ride.open_rides).to eq([tea_cups, tilta_whirl])
  end
end
