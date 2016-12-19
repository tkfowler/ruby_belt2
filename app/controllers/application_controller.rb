class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def require_login
    redirect_to '/main' if session[:user_id] == nil
  end
  def require_correct_user
    user = Group.find(params[:id]).user_id
    redirect_to "/groups" if current_user.id != user
  end
end
