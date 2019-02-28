class UsersController < ApplicationController
  before_action :find_user, only: [:show, :destroy]

  def show
    authorize @user
    @bookings = @user.books.map(&:bookings).flatten

    # user_books = Book.where(user_id: current_user.id)
    # @user_bookings = user_books.map { |x| x.bookings }
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:photo)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
