class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def index
    @user = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      log_in!(@user) #make in app
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  def show
    # @user = User.find_by_credentials(user_params)
    # redirect_to user_url(@user)
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:password, :username)
  end

end
