class Vehicle < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  validates :name, :brand, :price, :photo, presence: true
end
