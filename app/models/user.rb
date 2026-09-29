class User < ApplicationRecord
  # Devise modules...
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Association
  has_many :posts, dependent: :destroy

  has_one_attached :avatar
end