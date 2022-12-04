class Power < ApplicationRecord
    has_many :heros, through: :hero_powers
end
