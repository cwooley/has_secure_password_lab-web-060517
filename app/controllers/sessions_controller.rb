class SessionsController < ApplicationController
  def new

  end

  def create
    # byebug
    @user = User.find_by(name: session_params[:name])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      # byebug
      redirect_to user_path(@user)
    else
      redirect_to users_path
    end
  end

  def destroy
    session[:user_id] = nil
  end

  private

  def session_params
    params.require(:user).permit(:name, :password)
  end
end
