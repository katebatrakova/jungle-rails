class Admin::DashboardController < ApplicationController

  # Use the basic HTTP authentication to secure the whole application from non-authorised users
  http_basic_authenticate_with name: ENV["name"], password: ENV["password"]
  def show

  end
end
