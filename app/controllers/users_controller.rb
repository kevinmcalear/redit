class UsersController < ApplicationController

  def new
    @user = User.new

    render(:new)
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render(:new)
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email)
  end

  def authenticate
    unless logged_in?
      redirect_to root_path
    end
  end

  def authorize
    unless current_user == @user
      redirect_to root_path
    end
  end

end