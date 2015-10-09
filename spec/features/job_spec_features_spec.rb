# spec/features/job_spec_features_spec.rb

require 'rails_helper'

feature 'User creates a JobSpec' do

  before do
    visit new_job_spec_path
    fill_in 'Name', with: 'the_george_job'
    check 'Enabled'

    click_button 'Create Job spec'
  end


  scenario 'job spec is created' do
    expect(page).to have_content 'Success! JobSpec created.'
    expect(page).to have_content 'the_george_job'
  end

  scenario 'user attempts to create a duplicate JobSpec' do
    visit new_job_spec_path

    fill_in 'Name', with: 'the_george_job'
    click_button 'Create Job spec'

    expect(page).to have_content 'Error! JobSpec not created'
    expect(page).to have_content 'Name has already been taken'
  end
end
