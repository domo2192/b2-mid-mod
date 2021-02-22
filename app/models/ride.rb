class Ride < ApplicationRecord
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides


  def self.open_rides
    where(open: true).order(thrill_rating: :desc)
  end

end
