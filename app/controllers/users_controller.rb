class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Successful edit"
      redirect_to @user
    else
      flash.now[:danger] = "Invalid info"
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Successfully signed up for new account"
      redirect_to @user
    else
      flash.now[:danger] = "Invalid User name or Email"
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash.now[:success] = "Successfully deleted"
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
