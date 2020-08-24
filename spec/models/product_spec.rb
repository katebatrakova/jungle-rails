require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    # each product example needs its own @category created
  before (:each) do
    @category = Category.new(name: 'Travel')
  end

  # initial example that ensures that a product with all four fields set will indeed save successfully

   context "Name" do
    it 'each product should have a name' do
      @product = Product.new(name:'Blanket', category_id:6, description:'Comfortable', quantity:30, price:'50')
      expect(@product.name).to be_present
    end

    it 'product without name produces an error' do
      @product = Product.new(name:nil, category_id:6, description:'Comfortable', quantity:30, price:'50')
      expect(@product).to_not be_valid
      @product.save
      expect(@product.errors.messages[:name]).to include("can't be blank")
    end
  end

  context "Price" do
    it 'each product should have a price' do
      @product = Product.new(name:'Blanket', category_id:6, description:'Comfortable', quantity:30, price:'50')
      expect(@product.price).to be_present
    end

    it 'product without price produces an error' do
      @product = Product.new(name:'Blanket', category_id:6, description:'Comfortable', quantity:30, price:nil)
      expect(@product).to_not be_valid
      @product.save
      expect(@product.errors.messages[:price]).to include("can't be blank")
    end
  end


  context "Quantity" do
    it 'each product should have a quantity' do
      @product = Product.new(name:'Blanket', category_id:6, description:'Comfortable', quantity:30, price: 50)
      expect(@product.price).to be_present
    end

    it 'product without quantity produces an error' do
      @product = Product.new(name:'Blanket',category_id:6, description:'Comfortable', price:50, quantity:nil)
      expect(@product).to_not be_valid
      @product.save
      expect(@product.errors.messages[:quantity]).to include("can't be blank")
    end
  end

  context "Category" do
    it 'each product should have a category' do
      @product = Product.new(name:'Blanket', category_id:6, description:'Comfortable', quantity:30, price: 50)
      expect(@product.category_id).to be_present
    end
    it 'product without category produces an error' do
      @product = Product.new(name:'Blanket',category_id:nil, description:'Comfortable', price:50, quantity:30)
      expect(@product).to_not be_valid
    end

  end

  end
end
