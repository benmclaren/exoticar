class BookingsController < ApplicationController
  
  def index
    @bookings = Booking.all
    # raise
  end
  
  def create 
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @car = Car.find(params[:car_id])
    @booking.car = @car  
    @booking.save
    redirect_to bookings_path
    # raise
  end

  def destroy 
    @booking = Booking.find(params[:id])
    @car = @booking.car
    @booking.destroy
    # raise
    redirect_to bookings_path
  end

  private 

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
