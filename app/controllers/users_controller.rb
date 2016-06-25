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
    @user = User.update_attributes(user_params)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Successfully signed up for new account"
      redirect_to @user
    else
      flash.now[:danger] = "Invalid User name or Email"
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash.now[:sucess] = "Successfully deleted"
    render 'index'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end


end