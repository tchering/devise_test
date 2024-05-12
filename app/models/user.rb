class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address

  validates :email, presence: true
  validates :password, presence: true, allow_nil: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end
