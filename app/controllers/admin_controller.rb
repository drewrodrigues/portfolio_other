class AdminController < ApplicationController
  before_action :redirect_if_logged_in!, only: %i[new create]
  before_action :require_login!, only: :dashboard

  # GET /dashboard
  def dashboard; end

  # GET /login
  def new; end

  # POST /login
  def create
    if admin_authenticate
      login
      redirect_to dashboard_path
    else
      render :new
    end
  end

  # DELETE /logout
  def destroy
    logout
    redirect_to login_path
  end

  private

  def redirect_if_logged_in!
    redirect_to dashboard_path if logged_in?
  end

  def admin_authenticate
    params["username"] == ENV["portfolio_admin_username"] &&
    params["password"] == ENV["portfolio_admin_password"]
  end
end
