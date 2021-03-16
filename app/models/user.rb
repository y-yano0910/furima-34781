class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birth_date, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Full-width characters' } do
    validates :family_name
  end
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Full-width characters' } do
    validates :first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' } do
    validates :family_name_kana
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' } do
    validates :first_name_kana
  end
  

  has_many :items
  has_many :orders
end
