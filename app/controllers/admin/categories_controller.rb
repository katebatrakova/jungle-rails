class Admin::CategoriesController < ApplicationController
   # Use the basic HTTP authentication to secure the whole application from non-authorised users
   http_basic_authenticate_with name: ENV["name"], password: ENV["password"]
   def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  def category_params
    params.require(:category).permit(
      :name
    )
  end
end
