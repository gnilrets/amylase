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

RSpec.describe JobSchedulersController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # JobScheduler. As you add validations to JobScheduler, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { :timeout => '1' } }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # JobSchedulersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  after { JobScheduler.find.destroy if JobScheduler.find }

  describe "GET index", skip: "No GET index route" do
    it "assigns all job_schedulers as @job_schedulers" do
      job_scheduler = JobScheduler.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:job_schedulers)).to eq([job_scheduler])
    end
  end

  describe "GET show" do
    it "assigns the requested job_scheduler as @job_scheduler" do
      job_scheduler = JobScheduler.create! valid_attributes
      get :show, {:id => job_scheduler.to_param}, valid_session
      expect(assigns(:job_scheduler)).to eq(job_scheduler)
    end
  end

  describe "GET new" do
    it "assigns a job_scheduler as @job_scheduler" do
      get :new, {}, valid_session
      expect(assigns(:job_scheduler)).to be_a(JobScheduler)
    end
  end

  describe "GET edit", skip: "No GET edit route" do
    it "assigns the requested job_scheduler as @job_scheduler" do
      job_scheduler = JobScheduler.create! valid_attributes
      get :edit, {:id => job_scheduler.to_param}, valid_session
      expect(assigns(:job_scheduler)).to eq(job_scheduler)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "starts the scheduler" do
        post :create, {:job_scheduler => valid_attributes}, valid_session
        expect(assigns(:job_scheduler).running).to be
      end

      it "assigns a newly created job_scheduler as @job_scheduler" do
        post :create, {:job_scheduler => valid_attributes}, valid_session
        expect(assigns(:job_scheduler)).to be_a(JobScheduler)
      end

      it "redirects to the created job_scheduler" do
        post :create, {:job_scheduler => valid_attributes}, valid_session
        expect(response).to redirect_to(job_scheduler_url(JobScheduler.find))
      end
    end

    describe "with invalid params", skip: "There are no invalid parameters" do
      it "assigns a newly created but unsaved job_scheduler as @job_scheduler" do
        post :create, {:job_scheduler => invalid_attributes}, valid_session
        expect(assigns(:job_scheduler)).to be_a_new(JobScheduler)
      end

      it "re-renders the 'new' template" do
        post :create, {:job_scheduler => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update", skip: "No PUT update route" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested job_scheduler" do
        job_scheduler = JobScheduler.create! valid_attributes
        put :update, {:id => job_scheduler.to_param, :job_scheduler => new_attributes}, valid_session
        job_scheduler.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested job_scheduler as @job_scheduler" do
        job_scheduler = JobScheduler.create! valid_attributes
        put :update, {:id => job_scheduler.to_param, :job_scheduler => valid_attributes}, valid_session
        expect(assigns(:job_scheduler)).to eq(job_scheduler)
      end

      it "redirects to the job_scheduler" do
        job_scheduler = JobScheduler.create! valid_attributes
        put :update, {:id => job_scheduler.to_param, :job_scheduler => valid_attributes}, valid_session
        expect(response).to redirect_to(job_scheduler)
      end
    end

    describe "with invalid params" do
      it "assigns the job_scheduler as @job_scheduler" do
        job_scheduler = JobScheduler.create! valid_attributes
        put :update, {:id => job_scheduler.to_param, :job_scheduler => invalid_attributes}, valid_session
        expect(assigns(:job_scheduler)).to eq(job_scheduler)
      end

      it "re-renders the 'edit' template" do
        job_scheduler = JobScheduler.create! valid_attributes
        put :update, {:id => job_scheduler.to_param, :job_scheduler => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested job_scheduler" do
      job_scheduler = JobScheduler.create! valid_attributes
      expect {
        delete :destroy, {:id => job_scheduler.to_param}, valid_session
      }.to change(JobScheduler, :find).to(nil)
    end

    it "redirects to the job_scheduler path" do
      job_scheduler = JobScheduler.create! valid_attributes
      delete :destroy, {:id => job_scheduler.to_param}, valid_session
      expect(response).to redirect_to(job_scheduler_path)
    end
  end

end