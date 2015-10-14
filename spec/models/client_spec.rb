require 'rails_helper'

RSpec.describe Client, :type => :model do
  before { @client = FactoryGirl.create(:client) }
  subject { @client }

  it { should respond_to(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:name) }
  it { should be_valid }

end
