class UsersController < ApplicationController
  before_action :logged_in_user, only: [:destroy, :update]
  before_action :correct_user,   only: [:destroy, :update]

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

  def index
    @user = current_user
    @users = User.all
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
