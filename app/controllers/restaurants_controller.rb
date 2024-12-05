class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit 
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    @restaurant.pizza_ids = params[:restaurant][:pizza_ids].reject(&:empty?)
    @restaurant.save
    @restaurant.reload
    redirect_to @restaurant
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :pizza_ids)
  end
end
