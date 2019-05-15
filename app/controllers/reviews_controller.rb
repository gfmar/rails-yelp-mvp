class ReviewsController < ApplicationController

  def create
    @restaurant = Restaurant.find(params['restaurant_id'])

    @review = Review.new(params_review)
    @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def new
    @restaurant = Restaurant.find(params['restaurant_id'])
    @review = Review.new
  end

  private

  def params_review
    params.require('review').permit(:content, :rating)
  end
end
