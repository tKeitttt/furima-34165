class Item < ApplicationRecord
  
  with_options presence: true do    
    validates :item_name
    validates :item_text
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipment_date_id
    validates :price
    validates :item_image
  end
  
  belongs_to :user
  has_one :order
  has_one_attached :item_image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :shipment_date

end
