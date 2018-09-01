require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  subject(:project) { build(:project, id: 1) } 
  
  before do
    allow(Project).to receive(:find) { project }
    allow(Project).to receive(:all) { [project] }
  end

  describe 'GET index' do
    context 'when admin logged in' do
      it 'renders the template' do
        get :index

        expect(response).to render_template(:index)
      end
    end

    context 'when admin not logged in' do
      it 'renders the template' do
        get :index

        expect(response).to render_template(:index)
      end
    end

    it 'assigns @projects' do
      get :index

      expect(assigns(:projects)).to eq([project])
    end
  end

  describe 'GET show' do
    context 'when admin logged in' do
      it 'renders the template' do
        get :show, :params => { id: project }

        expect(response).to render_template(:show)
      end
    end

    context 'when admin not logged in' do
      it 'renders the template' do
        get :show, :params => { id: project }

        expect(response).to render_template(:show)
      end
    end

    it 'assigns @project' do
      get :show, :params => { id: project }

      expect(assigns(:project)).to eq(project)
    end
  end
  
  describe 'GET new' do
    context 'when admin logged in' do
      it 'renders the template'
      it 'assigns @project'
    end

    context 'when admin not logged in' do
      it 'redirects to root_path' do
        get :edit, :params => { id: project }

        expect(response).to redirect_to(root_path) 
      end
    end
  end

  describe 'GET edit' do
    context 'when admin logged in' do
      it 'renders the template'
      it 'assigns @project'
    end

    context 'when admin not logged in' do
      it 'redirects to root_path' do
        get :edit, :params => { id: project }

        expect(response).to redirect_to(root_path) 
      end
    end
  end

  describe 'POST create' do
    context 'when admin logged in' do
    end

    context 'when admin not logged in' do
      it 'redirects to root_path' do
        get :edit, :params => { id: project }

        expect(response).to redirect_to(root_path) 
      end
    end
  end

  describe 'PUT update' do
    context 'when admin logged in' do
    end

    context 'when admin not logged in' do
      it 'redirects to root_path' do
        get :edit, :params => { id: project }

        expect(response).to redirect_to(root_path) 
      end
    end
  end

  describe 'DELETE destroy' do
    context 'when admin logged in' do
    end

    context 'when admin not logged in' do
      it 'redirects to root_path' do
        get :edit, :params => { id: project }

        expect(response).to redirect_to(root_path) 
      end
    end
  end
end
