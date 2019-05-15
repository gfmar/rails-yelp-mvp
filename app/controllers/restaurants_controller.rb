class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
    # will render page
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    # Recevie from params
    # Create and save
    @restaurant = Restaurant.new(params_restaurant)

    if @restaurant.save
      # Redirect
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render :new
    end
  end

  def edit
    # Will generate form
  end

  def update
    if @restaurant.update(params_restaurant)
      redirect_to @restaurant, notice: 'Restaurant was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private
  def find_restaurant
    @restaurant = Restaurant.find(params['id'])
  end

  def params_restaurant
    params.require('restaurant').permit(:name, :address, :phone_number, :category)
  end
end
