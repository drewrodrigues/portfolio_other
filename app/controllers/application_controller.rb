class ApplicationController < ActionController::Base
  include ApplicationHelper

  def require_login!
    redirect_to login_path unless logged_in?
  end

  def login
    session[:admin] = true
  end

  def logout
    session.delete :admin
  end
end
