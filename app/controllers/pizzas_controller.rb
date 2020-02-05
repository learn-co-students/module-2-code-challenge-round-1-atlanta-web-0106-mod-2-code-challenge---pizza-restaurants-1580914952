class PizzasController < ApplicationController
  def index
    @pizzas = Pizza.all
  end

  def show 
    @pizza = Pizza.find(params[:id])
  end

  def new
    @pizza = Pizza.new 
  end

  def create 
    @pizza = Pizza.create(pizza_params)
    if @pizza.valid?
      redirect_to pizza_path(@pizza)
    else 
      render :new
    end
  end

  private 
  
  def pizza_params
    params.require(:pizza).permit(:name, :ingredients, :restaurant_id)
    byebug
  end
end
