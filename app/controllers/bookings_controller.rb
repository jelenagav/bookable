class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :destroy]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    if current_user
      authorize @booking
    end
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    authorize @booking
    if (@booking.save)
     redirect_to book_path(@booking.book)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:book_id, :booking_date, :status)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
