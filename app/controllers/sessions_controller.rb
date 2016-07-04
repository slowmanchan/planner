class SessionsController < ApplicationController
  def new
  
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "successful log in"
      log_in user
      params[:session][:remember_token] == '1' ? remember(user) : forget(user)
      remember user
      redirect_to user
    else
      flash.now[:danger] = "Invalid Password/Email combo"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to home_url
  end
end
