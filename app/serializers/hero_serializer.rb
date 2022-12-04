class HeroSerializer < ActiveModel::Serializer
  attributes :name, :super_name

  # has_many :hero_powers
  has_many :powers, through: :hero_powers
  
end
