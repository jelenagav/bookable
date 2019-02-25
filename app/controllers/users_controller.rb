class UsersController < ApplicationController
  before_action :find_user, only: [:show, :destroy]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if (@user.save)
     redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
