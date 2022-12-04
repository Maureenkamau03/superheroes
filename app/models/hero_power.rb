class HeroPower < ApplicationRecord
    belongs_to :hero
    belongs_to :power

    CATEGORY = ["Strong", "Weak", "Average"]
    validates :strength, inclusion: { in: (CATEGORY) }
 

end
