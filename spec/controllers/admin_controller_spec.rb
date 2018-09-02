require "rails_helper"

RSpec.describe AdminController, type: :controller do
  describe "GET dashboard" do
    context "admin logged in" do
      it "renders the template" do
        controller.login

        get :dashboard

        expect(response).to render_template :dashboard
      end
    end

    context "admin not logged in" do
      it "redirects to login" do
        get :dashboard

        expect(response).to redirect_to login_path
      end
    end
  end

  describe "GET new" do
    context "admin logged in" do
      it "redirects to dashboard" do
        controller.login

        get :new

        expect(response).to redirect_to dashboard_path
      end
    end

    context "admin not logged in" do
      it "renders the templates" do
        get :new

        expect(response).to render_template :new
      end
    end
  end

  describe "POST create" do
    context "admin logged in" do
      it "redirects to dashboard" do
        controller.login

        post :create

        expect(response).to redirect_to :dashboard
      end
    end

    context "admin not logged in" do
      context "with valid login" do
        it "redirects to dashboard" do
          post :create, params: {
            username: ENV["portfolio_admin_username"],
            password: ENV["portfolio_admin_password"],
          }

          expect(response).to redirect_to dashboard_path
        end

        it "sets the session" do
          post :create, params: {
            username: ENV["portfolio_admin_username"],
            password: ENV["portfolio_admin_password"],
          }

          expect(session[:admin]).to be_truthy
        end
      end

      context "with invalid login" do
        it "renders the new template" do
          post :create, params: {
            username: nil,
            password: nil,
          }

          expect(response).to render_template :new
        end
      end
    end
  end

  describe "DELETE destroy" do
    context "admin logged in" do
      it "redirects to root" do
        controller.login

        delete :destroy

        expect(response).to redirect_to login_path
      end

      it "clears the session" do
        controller.login

        delete :destroy

        expect(session[:admin]).to be_falsy
      end
    end

    context "admin not logged in" do
      it "renders the new template" do
        delete :destroy

        expect(response).to redirect_to login_path
      end
    end
  end
end
