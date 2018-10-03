class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :party
  has_one :booking, dependent: :destroy
end
