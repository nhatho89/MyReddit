class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user
      log_in!(user)
      flash[:hey] = "Hello #{current_user.username}"
      redirect_to user_url(user)
    else
      # user = User.new(username: params[:user][:username],
      # password: params[:user][:password]
      # )
      # user.validate
      # flash.now[:errors] = user.errors.full_messages
      flash.now[:errors] = ["Invalid Login!"]
      render :new
    end
  end

  def destroy
    log_out!
    redirect_to new_session_url
  end

end
