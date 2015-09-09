class SessionsController < ApplicationController
  def new
    render '/sessions/new'
  end
  def create
    @user = User.find_by(email: params[:email])
    if @user.email && @user.authenticate(params[:password])
      set_current_user(@user)
    else
      render '/sessions/new'
    end
  end
  def destroy
    session.destroy
    redirect '/'
  end
    private
  def set_current_user(user)
    session[:user_id] = user.id
    @current_user = user
  end


end
