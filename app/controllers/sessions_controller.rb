class SessionsController < ApplicationController
  before_action :logged_in?, except: [:destroy]

  def new
    :new
  end

  def create
    user = User.find_by_credentials(user_params[:email], user_params[:password])
    if user
      session[:session_token] = user.reset_session_token!
      redirect_to user_url(user)
    else
      flash[:errors] = user.errors.full_messages
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
