class ApplicationController < ActionController::Base
  before_action :require_user
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= Student.find(session[:id]) if session[:id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:notice] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end
  
end
