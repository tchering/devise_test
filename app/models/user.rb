class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :microposts, dependent: :destroy
  has_one :address, dependent: :destroy
  has_one_attached :profile_picture, dependent: :destroy
  accepts_nested_attributes_for :address

  # validates :email, presence: true  # This line is not needed becuase Devise already validates the email
  # validates :password, presence: true, allow_nil: true   # This line is not needed becuase Devise already validates the password

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  def index_profile
    profile_picture.variant(resize: '100x100')
  end

  def feed
    Micropost.where('user_id = ?', id)
  end
end
