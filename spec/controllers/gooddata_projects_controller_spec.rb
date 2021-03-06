require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe GooddataProjectsController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # GooddataProject. As you add validations to GooddataProject, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryGirl.build(:gooddata_project).attributes
  }

  let(:invalid_attributes) {
    FactoryGirl.build(:gooddata_project, project_uid: 'not-a-uid').attributes
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # GooddataProjectsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all gooddata_projects as @gooddata_projects" do
      gooddata_project = GooddataProject.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:gooddata_projects)).to eq([gooddata_project])
    end
  end

  describe "GET show" do
    it "assigns the requested gooddata_project as @gooddata_project" do
      gooddata_project = GooddataProject.create! valid_attributes
      get :show, {:id => gooddata_project.to_param}, valid_session
      expect(assigns(:gooddata_project)).to eq(gooddata_project)
    end
  end

  describe "GET new" do
    it "assigns a new gooddata_project as @gooddata_project" do
      get :new, {}, valid_session
      expect(assigns(:gooddata_project)).to be_a_new(GooddataProject)
    end
  end

  describe "GET edit" do
    it "assigns the requested gooddata_project as @gooddata_project" do
      gooddata_project = GooddataProject.create! valid_attributes
      get :edit, {:id => gooddata_project.to_param}, valid_session
      expect(assigns(:gooddata_project)).to eq(gooddata_project)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new GooddataProject" do
        expect {
          post :create, {:gooddata_project => valid_attributes}, valid_session
        }.to change(GooddataProject, :count).by(1)
      end

      it "assigns a newly created gooddata_project as @gooddata_project" do
        post :create, {:gooddata_project => valid_attributes}, valid_session
        expect(assigns(:gooddata_project)).to be_a(GooddataProject)
        expect(assigns(:gooddata_project)).to be_persisted
      end

      it "redirects to the created gooddata_project" do
        post :create, {:gooddata_project => valid_attributes}, valid_session
        expect(response).to redirect_to(GooddataProject.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved gooddata_project as @gooddata_project" do
        post :create, {:gooddata_project => invalid_attributes}, valid_session
        expect(assigns(:gooddata_project)).to be_a_new(GooddataProject)
      end

      it "re-renders the 'new' template" do
        post :create, {:gooddata_project => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        valid_attributes.merge({ 'description' => 'modified' })
      }

      it "updates the requested gooddata_project" do
        gooddata_project = GooddataProject.create! valid_attributes
        put :update, {:id => gooddata_project.to_param, :gooddata_project => new_attributes}, valid_session
        gooddata_project.reload
        expect(gooddata_project.description).to eq 'modified'
      end

      it "assigns the requested gooddata_project as @gooddata_project" do
        gooddata_project = GooddataProject.create! valid_attributes
        put :update, {:id => gooddata_project.to_param, :gooddata_project => valid_attributes}, valid_session
        expect(assigns(:gooddata_project)).to eq(gooddata_project)
      end

      it "redirects to the gooddata_project" do
        gooddata_project = GooddataProject.create! valid_attributes
        put :update, {:id => gooddata_project.to_param, :gooddata_project => valid_attributes}, valid_session
        expect(response).to redirect_to(gooddata_project)
      end
    end

    describe "with invalid params" do
      it "assigns the gooddata_project as @gooddata_project" do
        gooddata_project = GooddataProject.create! valid_attributes
        put :update, {:id => gooddata_project.to_param, :gooddata_project => invalid_attributes}, valid_session
        expect(assigns(:gooddata_project)).to eq(gooddata_project)
      end

      it "re-renders the 'edit' template" do
        gooddata_project = GooddataProject.create! valid_attributes
        put :update, {:id => gooddata_project.to_param, :gooddata_project => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested gooddata_project" do
      gooddata_project = GooddataProject.create! valid_attributes
      expect {
        delete :destroy, {:id => gooddata_project.to_param}, valid_session
      }.to change(GooddataProject, :count).by(-1)
    end

    it "redirects to the gooddata_projects list" do
      gooddata_project = GooddataProject.create! valid_attributes
      delete :destroy, {:id => gooddata_project.to_param}, valid_session
      expect(response).to redirect_to(gooddata_projects_url)
    end
  end

end
