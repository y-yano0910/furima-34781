# テーブル設計

## usersテーブル

| Column           | Type               | Options                   |
| ---------------- |------------------- | ------------------------- |
| nickname         | string             | null: false               |
| email            | string             | null: false, unique: true |
| password         | encrypted_password | null: false               |
| family_name      | string             | null: false               |
| first_name       | string             | null: false               |
| family_name_kana | string             | null: false               |
| first_name_kana  | string             | null: false               |
| birth_date       | date               | null: false               |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column              | Type       | Options                        |
| ------------------- |----------- | ------------------------------ |
| name                | string     | null: false                    |
| description         | text       | null: false                    |
| price               | integer    | null: false                    |
| category_id         | integer    | null: false                    |
| condition_id        | integer    | null: false                    |
| shipping_charges_id | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| shipping_days_id    | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to       :user
- has_one          :order
- has_one_attached :image

## ordersテーブル

| Column    | Type       | Options                        |
| --------- |----------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping

## shippingsテーブル

| Column        | Type       | Options                        |
| ------------- |----------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| municipality  | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order

