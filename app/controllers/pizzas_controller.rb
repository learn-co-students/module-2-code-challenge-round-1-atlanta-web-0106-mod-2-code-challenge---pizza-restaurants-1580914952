class PizzasController < ApplicationController
  def index
    @pizzas = Pizza.all
  end

  def show
    @pizza = Pizza.find(params[:id])
  end

  def new
    @pizza = Pizza.new
    @restaurant_pizza
  end

  def create
    @pizza = Pizza.new(pizza_params)
    if @pizza.save
      restaurant_pizza = RestaurantPizza.create(pizza_id: @pizza.id, restaurant_id: params[:restaurant_pizza][:restaurant_id])
      redirect_to pizza_path(@pizza)
    else
      render :new
    end
  end

  private

  def pizza_params
    params.require(:pizza).permit(:name, :ingredients, :restaurant_id)
  end
end
