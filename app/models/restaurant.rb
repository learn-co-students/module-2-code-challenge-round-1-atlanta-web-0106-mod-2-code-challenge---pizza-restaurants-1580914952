class Restaurant < ApplicationRecord
    has_many :restaurantpizzas
    has_many :pizzas, through: :restaurantpizzas

    # def show_pizzas
    #     self.pizzas.name
    # end

    #I tried
    #worth a shot
end
