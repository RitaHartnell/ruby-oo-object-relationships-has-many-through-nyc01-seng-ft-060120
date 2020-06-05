class Waiter
    @@all = []

    def initialize(name, xp)
        @name = name
        @experience = xp
        @@all << self
    end

    def new_meal(customer, total, tip)
        meal = Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select { |meal|
            meal.waiter == self
        }
    end

    def best_tipper
        my_meals= self.meals
        tips = my_meals.map { |meal|
            meal.tip
        }

        best = my_meals.select { |meal|
            meal.tip == tips.max
        }
        best[0].customer
        
    end

    def self.all
        @@all
    end

end