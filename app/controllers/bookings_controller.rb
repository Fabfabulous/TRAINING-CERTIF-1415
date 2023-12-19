class BookingsController < ApplicationController
  def index
    # Display all my ongoing booking > Start date after the date of the day
    @my_bookings = current_user.bookings
    @my_bookings = @my_bookings.where('start_date >= ?', Date.today)
  end

  def new
    @booking = Booking.new
  end

  def create
    @vehicle = Vehicle.find(params[:vehicle_id])
    @booking = Booking.new(booking_params)
    @booking.vehicle = @vehicle
    @booking.user = current_user
    if @booking.save
      redirect_to root_path, notice: "Vehicle correctly booked!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
