class Party < ApplicationRecord
  has_many :tickets, dependent: :destroy
  validates :name, presence: true
  validates :date, presence: true
  validates :organizer, presence: true
end
