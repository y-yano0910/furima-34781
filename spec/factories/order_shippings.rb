FactoryBot.define do
  factory :order_shipping do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    prefecture_id { Faker::Number.within(range: 2..48) }
    municipality { '中央区' }
    house_number { '東日本橋3-5-6' }
    building_name { '日本橋ハイツ' }
    phone_number { '09012345678' }
  end
end
