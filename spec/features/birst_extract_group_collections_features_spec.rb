# spec/features/birst_extract_group_collections_features_spec.rb

require 'rails_helper'

feature "User creates a BirstExtractGroupCollection" do

  before do
    # Populate with some extract groups
    birst_extract_groups = FactoryGirl.create_list(:birst_extract_group, 3)

    # Choose some extract_groups to select
    selected_extract_groups = birst_extract_groups[0..1]

    visit new_birst_extract_group_collection_path
    fill_in 'Name', with: 'A BirstExtractGroupCollection'

    selected_extract_groups.each do |ds|
      find(:css, "#birst_extract_group_collection_birst_extract_group_ids_#{ds.id}").set(true)
    end
  end

  scenario 'with valid data' do
    click_button 'Create Birst extract group collection'

    expect(page).to have_content 'Success! BirstExtractGroupCollection created'
    expect(page).to have_xpath "//span[@class='glyphicon glyphicon-ok']", count: 2
    expect(page).to have_xpath "//span[@class='glyphicon glyphicon-minus']", count: 1
  end

  scenario 'with invalid data' do
    fill_in 'Name', with: ''
    click_button 'Create Birst extract group collection'

    expect(page).to have_content 'Error! BirstExtractGroupCollection not created'
    expect(page).to have_content "Name can't be blank"
  end
end
