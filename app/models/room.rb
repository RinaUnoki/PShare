class Room < ApplicationRecord
  
  belongs_to :user
  
  has_one :reservation
  
  attachment :image
  with_options presence: true do
    validates :title
    validates :body
    validates :image
    validates :price
    validates :adress
  end
end
