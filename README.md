# README

# テーブル設計

## usersテーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name_c    | string | null: false | 
| last_name_c     | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| item_image     |            | null: false                    |
| item_name      | string     | null: false                    |
| item_text      | string     | null: false                    |
| category       | string     | null: false, foreign_key: true | 
| status         | string     | null:false                     |
| delivery_fee   | string     | null: false                    |
| shipping_from  | string     | null: false                    |
| shipment_date  | string     | null: false                    |
| price          | string     | null: false                    |  
| judgement      | string     |                                |
| seller_user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order

## ordersテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_id         | references | null: false, foreign_key: true |
| buyer_user_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addressesテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| first_name_c    | string     | null: false                    | 
| last_name_c     | string     | null: false                    |
| first_name_kana | string     | null: false                    |
| last_name_kana  | string     | null: false                    |
| postal_code     | string     | null: false                    |
| prefecture      | string     | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| phone_number    | string     | null: false                    | 
| order_id        | references | null: false, foreign_key: true | 

### Association

- belongs_to :order