describe "the add a product process" do
  before(:each) do
    fill_in 'Email', :with => 'ela@v.com'
    fill_in 'Password', :with => 'cats123'
    fill_in 'Password confirmation', :with => 'cats123'
    click_on 'Sign Up'
    click_on 'Sign out'
    click_on 'Sign-in'
    fill_in 'Email', :with => 'ela@v.com'
    fill_in 'Password', :with => 'cats'
    click_on 'Sign in'
  end
  it "adds a new product" do
  visit products_path
  click_link 'Create new product'
  fill_in 'Name', :with => 'Chair'
  fill_in 'Cost', :with => '12'
  fill_in 'Country of origin', :with => 'United States'
  click_on 'Create Product'
  expect(page).to have_content 'Product successfully added!'
  expect(page).to have_content 'Chair'
end

end
