require 'rails_helper'


describe('create an product path', {:type => :feature})  do
  before(:each) do
    visit('/users/sign_up')
    fill_in 'Email', :with => 'ela@v.com'
    fill_in 'Password', :with => 'cats123'
    fill_in 'Password confirmation', :with => 'cats123'
    choose 'user_admin_true'
    click_on 'Sign up'
  end
  it "adds a new product" do
    visit('/products')
    click_link 'Create new product'
    fill_in 'Name', :with => 'Chair'
    fill_in 'Cost', :with => '12'
    fill_in 'Country of origin', :with => 'United States'
    click_on 'Create Product'
    expect(page).to have_content 'Product successfully added!'
    expect(page).to have_content 'Chair'
  end
  it "edits a product" do
    visit('/products')
    click_link 'Create new product'
    fill_in 'Name', :with => 'Chair'
    fill_in 'Cost', :with => '12'
    fill_in 'Country of origin', :with => 'United States'
    click_on 'Create Product'
    click_on 'Chair'
    click_on 'Edit'
    fill_in 'Name', :with => 'Candle'
    fill_in 'Cost', :with => '15'
    fill_in 'Country of origin', :with => 'Mexico'
    click_on 'Update Product'
    expect(page).to have_content 'Product successfully updated!'
    expect(page).to have_content 'Candle'

  end
  it "deletes a product" do
    visit('/products')
    click_link 'Create new product'
    fill_in 'Name', :with => 'Chair'
    fill_in 'Cost', :with => '12'
    fill_in 'Country of origin', :with => 'United States'
    click_on 'Create Product'
    click_on 'Chair'
    click_on 'Delete'
    expect(page).to have_content ''
  end
  it "lets a user add a review" do
    visit('/products')
    click_link 'Create new product'
    fill_in 'Name', :with => 'Chair'
    fill_in 'Cost', :with => '12'
    fill_in 'Country of origin', :with => 'United States'
    click_on 'Create Product'
    click_on 'Chair'
    click_on 'Add a review'
    fill_in 'Author', :with => 'Angela'
    fill_in 'Content body', :with => 'hey there this is a thing that hopefully has 50 characters'
    fill_in 'Rating', :with => '3'
    click_on 'Create Review'
    expect(page).to have_content 'Angela'
  end

end
