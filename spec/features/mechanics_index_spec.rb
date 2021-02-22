require 'rails_helper'

RSpec.describe 'Mechanics index page' do
  before :each do
    @dominic = Mechanic.create!(name: "Dominic", years_experience: 10)
    @ronny = Mechanic.create!(name: "Ronny", years_experience: 5)
    @leroy = Mechanic.create!(name: "Leroy", years_experience: 15)
  end

  it "can show mechanic to show page" do
    visit "/mechanics"
    expect(page).to have_content("All Mechanics")
    expect(page).to have_content(@dominic.name)
    expect(page).to have_content(@ronny.name)
    expect(page).to have_content(@leroy.name)
    expect(page).to have_content(@leroy.years_experience)
    expect(page).to have_content(@ronny.years_experience)
    expect(page).to have_content(@dominic.years_experience)
    expect(page).to have_content("Average Years Experience: 10")
  end
end
