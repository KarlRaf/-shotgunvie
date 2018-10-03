class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :tickets, dependent: :nullify
  has_many :bookings, dependent: :nullify

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates_format_of :email,:with => Devise::email_regexp
  validates :email, presence: true
  validates :school, presence: true
  validates :phonenumber, presence: true
  # validates :bio, length: { minimum: 20 }, allow_nil: true
  # mount_uploader :photo, PhotoUploader

end
