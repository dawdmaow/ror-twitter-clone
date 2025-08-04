class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  
  before_action :set_no_cache_headers if Rails.env.development?
  
  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound
    session[:user_id] = nil
  end
  
  def logged_in?
    !!current_user
  end
  
  def require_login
    unless logged_in?
      redirect_to new_user_path, alert: "Please log in to continue."
    end
  end
  
  def set_no_cache_headers
    response.headers["Cache-Control"] = "no-cache, no-store, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "0"
  end
end
