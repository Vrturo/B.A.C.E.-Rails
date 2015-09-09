class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
   @user = User.new(user_params)
    if @user.save
      set_current_user(@user)
      redirect '/'
    else
      render 'users_create_path'
    end
  end
  private
  def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end


