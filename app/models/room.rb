class Room < ApplicationRecord
  
  belongs_to :user, optional: true
  
  has_many :reservations, dependent: :destroy
  
  attachment :image
  with_options presence: true do
    validates :title
    validates :body
    validates :image
    validates :price
    validates :adress
  end
end
