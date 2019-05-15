class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show, :edit, :update]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    # Recevie from params
    # Create and save
    # Redirect
  end

  def edit
    #
  end

  def update
    #
  end

  def destroy
    #
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params['id'])
  end

end
