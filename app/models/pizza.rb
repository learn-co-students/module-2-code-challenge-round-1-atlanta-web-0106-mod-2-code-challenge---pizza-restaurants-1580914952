class Pizza < ApplicationRecord
    has_many :restaurant_pizzas
    has_many :restaurants, through: :restaurant_pizzas

    validates :name, presence: true
    validates :ingredients, presence: true
    validates :name, uniqueness: true

    def restaurant=(restaurant)
        # restaurant = Restaurant.find(params[:restaurant_id])
        RestaurantPizza.create(pizza_id: self.id, restaurant_id: restaurant.id)
    end
end
