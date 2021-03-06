class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && ( user.authenticate(params[:password]) )
      
      # save the user_id in the session hash
      session[:user_id] = user.id

      # and redirect to that user's home page
      redirect_to( root_path )
    else

      # the email/password is wrong!
      @message = "This email and password combination does not exist."
      redirect_to ( root_path )
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end