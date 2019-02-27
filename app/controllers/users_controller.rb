class UsersController < ApplicationController
  before_action :find_user, only: [:show, :destroy]

  def show
    authorize @user
    @bookings = @user.books.map(&:bookings).flatten
    @book = Book.find(params[:id])
  end

  def destroy
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
