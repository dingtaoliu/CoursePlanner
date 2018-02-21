class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'Thank you for signing up!'
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def allowed_params
    params.require(:user).permit(:username, :password)
  end
end
