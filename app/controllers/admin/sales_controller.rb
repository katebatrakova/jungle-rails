class Admin::SalesController < ApplicationController
  #index action is the method on the controller
  def index
    # implicitly it renders  index template 
   @sales = Sale.all
  end
end
