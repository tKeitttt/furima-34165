class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :order_id, :item_id, :user_id

  with_options presence: true do
    validates :user_id, :order_id, :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city, :address
    validates :phone_number, format: {with: /^0\d{9,10}$/}
  end

end
