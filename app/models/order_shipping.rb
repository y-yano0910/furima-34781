class OrderShipping
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :house_number, :building_name,
                :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code
    validates :prefecture_id
    validates :municipality
    validates :house_number
    validates :phone_number
    validates :token
  end

  validates_format_of :postal_code, with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly'
  validates_numericality_of :prefecture_id, other_than: 1, message: 'Select'
  validates_numericality_of :phone_number, only_integer: true, message: 'Input only number'
  validates_length_of :phone_number, maximum: 11

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Shipping.create(
      postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id
    )
  end
end
