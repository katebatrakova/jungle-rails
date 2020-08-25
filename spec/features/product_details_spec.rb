require 'rails_helper'

RSpec.feature "User navigates from homepage to the product detail page", type: :feature, js: true do


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

#SCENARIO
scenario "User can click on Details button and go to the particular article" do
  # ACT
  visit root_path
   # ACT 
  find(".product", match: :first).click_link('Details')
  # puts page.html 
  # VERIFY
  expect(page).to have_css('.product-detail')
  # SCREENSHOT 
  save_screenshot('product_details.png')
end
end
