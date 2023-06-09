class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :order

  validates :image, presence: true
  validates :title, presence: true
  validates :detail, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :condtion_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shippingcost_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :reserve_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, numericality: { only_integer: true },
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condtion
  belongs_to :shippingcost
  belongs_to :prefecture
  belongs_to :reserve
end
