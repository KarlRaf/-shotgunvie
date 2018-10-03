class Ticket < ApplicationRecord
  belongs_to :user
  has_one :booking, dependent: :destroy
end
