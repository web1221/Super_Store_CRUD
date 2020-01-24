require 'rails_helper'


describe('create an product path', {:type => :feature})  do
  before(:each) do
    @product = Product.create({:name => "Chair", :cost => "12", :country_of_origin => "United States"})
    @product.save
    visit('/users/sign_up')
    fill_in 'Email', :with => 'ela@v.com'
    fill_in 'Password', :with => 'cats123'
    fill_in 'Password confirmation', :with => 'cats123'
    choose 'user_admin_false'
    click_on 'Sign up'
  end
  it "adds a review to a product" do
    visit('/products')
    click_on 'Chair'
    fill_in 'Name', :with => 'Chair'
    fill_in 'Cost', :with => '12'
    fill_in 'Country of origin', :with => 'United States'
    click_on 'Create Product'
    expect(page).to have_content 'Product successfully added!'
    expect(page).to have_content 'Chair'
  end
end
