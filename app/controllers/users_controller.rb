class UsersController < ApplicationController
  before_action :set_user, only: [ :show, :update, :destroy, :edit ]

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user)
    end
    authorize @user
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :phonenumber, :school, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
