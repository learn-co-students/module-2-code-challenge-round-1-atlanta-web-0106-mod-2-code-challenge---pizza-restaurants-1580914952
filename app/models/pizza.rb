class Pizza < ApplicationRecord
    validates :name, :ingredients, presence: true 


    has_many :restaurant_pizzas 
    has_many :restaurants, through: :restaurant_pizzas
end
