class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_day

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :shipping_day_id
  end

  validates_format_of :price, with: /\A[0-9]+\z/, message: 'Half-width number'
  validates_numericality_of :price, only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                                    message: 'Out of setting range'

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :shipping_day_id
  end

  belongs_to :user
  has_one :order
  has_one_attached :image
end
