class Hero < ApplicationRecord
    has_many :powers, through: :hero_powers
end
