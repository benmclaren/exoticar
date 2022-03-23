class CarsController < ApplicationController

  def index 
    @cars = Car.all
  end

  def new 
    @car = Car.new
  end

  def show 
    @car = Car.find(params[:id])
    @booking = Booking.new
  end 

  def create 
    @car = Car.new(car_params)
    @car.user = current_user
    @car.save
    redirect_to cars_path
  end

  def update 
    # @car = Car.find(params[:id])
    # @car.update(car_params)
    # redirect_to car_path(@car)
  end

  def destroy 
    @car = Car.find(params[:id])
    @car.destroy
    # raise
    redirect_to cars_path
  end

  private

  def car_params
    params.require(:car).permit(:make, :model, :id)
  end 
end
