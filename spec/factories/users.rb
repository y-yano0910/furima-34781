FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    family_name {"てすと"}
    first_name {"てすと"}
    family_name_kana {"カタカナ"}
    first_name_kana {"カタカナ"}
    birth_date {Faker::Date.in_date_period}
  end
end