require 'rails_helper'

RSpec.describe JobSpec, :type => :model do

  before { @job_spec = FactoryGirl.create(:job_spec) }
  subject { @job_spec }

  it { should respond_to(:name) }
  it { should respond_to(:enabled) }
  it { should respond_to(:job_schedule_group) }

  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:name) }

  it { should belong_to(:job_schedule_group) }
  it { should belong_to(:client) }

  it { should have_many(:launched_jobs) }

  it { should be_valid }


  describe "default values" do
    specify "enabled has correct default" do
      expect(@job_spec.enabled).to eq true
    end
  end

  it "should fail when name already exists" do
    expect(@job_spec.dup).not_to be_valid
  end
end
