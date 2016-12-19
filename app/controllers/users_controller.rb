class UsersController < ApplicationController
  def main
    if current_user
      redirect_to '/groups'
    else
      render 'main'
    end
  end

  def create
    @user = User.create( user_params )
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to '/groups'
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to '/main'
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
