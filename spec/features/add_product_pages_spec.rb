require 'rails_helper'


describe('create an product path', {:type => :feature})  do
  before(:each) do
    visit('/users/sign_up')
    fill_in 'Email', :with => 'ela@v.com'
    fill_in 'Password', :with => 'cats123'
    fill_in 'Password confirmation', :with => 'cats123'
    choose 'user_admin_true'
    click_on 'Sign Up'
  end
  it "adds a new product" do
    visit products_path
    save_and_open_page
    click_link 'Create new product'
    fill_in 'Name', :with => 'Chair'
    fill_in 'Cost', :with => '12'
    fill_in 'Country of origin', :with => 'United States'
    click_on 'Create Product'
    expect(page).to have_content 'Product successfully added!'
    expect(page).to have_content 'Chair'
  end

end
