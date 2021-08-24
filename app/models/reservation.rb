class Reservation < ApplicationRecord
  belongs_to :room, optional: true
  belongs_to :user, optional: true
  
   with_options presence: true do
    validates :StartDate
    validates :EndDate
    validates :person_num
  end
end
