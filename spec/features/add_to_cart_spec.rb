require 'rails_helper'

RSpec.feature "My Cart increases by 1 when user adds to it", type: :feature, js: true do

# SETUP
before :each do
  @category = Category.create! name: 'Apparel'

  10.times do |n|
    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
  end
end

# SCENARIO
scenario "User can click on AddtoCart button and MyCart on nav inreases by 1" do
  # ACT
  visit root_path
   # ACT 
  find(".product", match: :first).click_button('Add')
  # VERIFY
  within'#navbar' do
     find('a', text: 'My Cart (1)')
  end
  expect(page).to have_content('My Cart (1)')  
  # SCREENSHOT 
  save_screenshot('addCart3.png')
end

end
