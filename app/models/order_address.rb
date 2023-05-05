class OrderAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :municipalities, :address, :building, :telephone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalities
    validates :address
    validates :telephone_number,
               format: { with: /\A\d+\z/, message: "is invalid. Input only number" },length: { minimum: 10, maximum: 11 }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    # 購入情報を保存し、変数orderに代入する
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    Address.create(postcode: postcode, prefecture_id: prefecture_id, municipalities: municipalities , address: address, building: building, telephone_number: telephone_number, order_id: order.id)
  end
end