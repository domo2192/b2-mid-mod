class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.open_rides
  end

  def update
    @mechanic = Mechanic.find(params[:id])
    ride = Ride.find(params[:mechanic][:search])
    @mechanic.rides << ride
    redirect_to mechanic_path(@mechanic.id)
  end
end
