class ApplicationController < ActionController::Base
  helper_method :logged_in?

  def login
    session[:admin] = true
  end

  def logout
    session.delete :admin
  end

  def logged_in?
    session[:admin]
  end

  def require_login!
    redirect_to login_path unless logged_in?
  end
end
