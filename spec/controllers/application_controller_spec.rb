require 'rails_helper'

class MockController < ApplicationController; end

RSpec.describe ApplicationController, type: :controller do
  describe '#login' do
    it 'sets session[:admin] to true' do
      expect(controller.logged_in?).to be_falsy 

      controller.login

      expect(session[:admin]).to be_truthy
    end
  end

  describe '#logout' do
    context 'when user logged in' do
      it 'deletes session[:admin]' do
        controller.login

        controller.logout

        expect(session[:admin]).to be_falsy
      end
    end
  end

  describe '#logged_in?' do
    context 'when logged in' do
      it 'returns true' do
        controller.login

        expect(controller.logged_in?).to eq true
      end
    end

    context 'when not logged in' do
      it 'returns nil' do
        expect(controller.logged_in?).to eq nil
      end
    end
  end

  describe '#require_login!' do
    # this controller is used to keep the test non-specific to a controller
    controller MockController do
      before_action :require_login!, only: :mock

      def mock
        head :ok
      end
    end

    before do
      set_mock_route
    end

    context 'when logged in' do
      it 'does nothing' do
        controller.login
        get :mock 

        expect(response.status).to eq 200
      end
    end

    context 'when not logged in' do
      it 'redirects to login' do
        get :mock 

        expect(response).to redirect_to login_path
      end
    end
  end

  private

  def set_mock_route
    routes.draw { get 'mock' => 'mock#mock' }
  end
end

