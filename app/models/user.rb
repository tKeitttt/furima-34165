class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[一-龥ぁ-ん]/ }
  validates :first_name, presence: true, format: { with: /\A[一-龥ぁ-ん]/ }
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  validates :birthday, presence: true
  VALID_PASSWORD_REGEX = /(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}/
  validates_format_of :password, with: VALID_PASSWORD_REGEX
end
