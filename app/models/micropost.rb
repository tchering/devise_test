class Micropost < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true, length: { minimum: 5, maximum: 140 }
  default_scope -> { order(created_at: :desc) }
end


