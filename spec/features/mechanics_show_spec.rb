require 'rails_helper'
RSpec.describe 'Mechanics show page' do
  before :each do
    @dominic = Mechanic.create!(name: "Dominic", years_experience: 10)
    @ronny = Mechanic.create!(name: "Ronny", years_experience: 5)
    @leroy = Mechanic.create!(name: "Leroy", years_experience: 15)

  end

  it "when going to mechanic show page I all expected info" do
    tilta_whirl = @dominic.rides.create(name: "Tilt a Whirl", thrill_rating: 7, open:true)
    roller_coaster = @dominic.rides.create(name: "Roller Coaster", thrill_rating: 5, open:false)
    tea_cups = @dominic.rides.create(name: "Tea cups", thrill_rating: 9, open:true)
      visit mechanic_path(@dominic)
      expect(page).to have_content(@dominic.name)
      expect(page).to have_content(@dominic.years_experience)
      expect(page).to have_content(@dominic.name)
      expect(page).to have_content(tilta_whirl.name)
      expect(page).not_to have_content(roller_coaster.name)
      expect(page).to have_content(tea_cups.name)
      expect(tea_cups.name).to appear_before(tilta_whirl.name)
  end

  it "you can add a ride to the mechanics workload" do
    tilta_whirl = @leroy.rides.create(name: "Tilt a Whirl", thrill_rating: 7, open:true)
    roller_coaster = @leroy.rides.create(name: "Roller Coaster", thrill_rating: 5, open:false)
    tea_cups = Ride.create(name: "Tea cups", thrill_rating: 9, open:true)
    visit mechanic_path(@leroy)
    expect(page).not_to have_content(tea_cups.name)
    expect(page).to have_content("Add a ride to workload:")
    fill_in :ride_id, with: 3
    click_button("Submit")
    expect(page).to have_content(tea_cups.name)
  end

end
