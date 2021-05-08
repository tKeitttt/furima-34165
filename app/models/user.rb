class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  with_options presence: true do
    validates :nickname
    validates :birthday

    with_options format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/ } do
      validates :last_name
      validates :first_name
    end

    with_options format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ } do
      validates :last_name_kana
      validates :first_name_kana
    end

    with_options format: { with: /(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}/ } do
      validates :password
    end
  end
end
