class UsersController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]

  def show
     @user  = User.find(params[:id])
     @posts = @user.posts.order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "Profile updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :name, :website, :bio, :phone, :gender, :avatar)
  end
end