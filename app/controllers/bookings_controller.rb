class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :destroy]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)

    if (@booking.save)
     redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :book_id, :booking_date)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
