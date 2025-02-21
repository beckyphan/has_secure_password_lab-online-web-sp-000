class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.valid? && @user = @user.try(:authenticate, params[:user][:password])
      session[:user_id] = @user.id
      redirect_to home_path
    else
      redirect_to login_path
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end
end
