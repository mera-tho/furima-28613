# DB設計

## usersテーブル

| Column       | Type   |  Options                 |
| -------------|--------|--------------------------|
| nickname     | string | null: false              |
| last_name    | string | null: false              |
| first_name   | string | null: false              |
| last_name    | string | null: false              |
| birthday     | date   | null: false              |
|  email       | string | null: false ,unique: true|
| password     | string | null: false              |

Association
・has_many: items
・has_many: purchases
・has_one: address

## itemsテーブル

| Column       | Type   |  Options    |
| -------------|--------|-------------|
| name         | string | null: false |
| price        | integer| null: false |
| explanation  | text   | null: false |
| category     | string | null: false |
| condition    | string | null: false |
| shipping_fee | string | null: false |
| shipping_area| string | null: false |
| shipping_date| string | nul|: false |    

Association
・belongs_to: user
・has_one: purchases

## purchasesテーブル

| Column       |    Type    |         Options                |
| -------------|------------|--------------------------------|
| user_id      | references | null: false  ,foreign_key: true|
| item_id      | references | null: false  ,foreign_key: true|

Association
・belongs_to: user
・belongs_to: items

## addressesテーブル

| Column       | Type       |  Options                      |
| -------------|------------|-------------------------------|
| postal_code  | string     | null: false                   |
| prefecture   | string     | null: false                   |
| city         | string     | null: false                   |
| house_number | string     | null: false                   |
| building     | string     |                               |
| user_id      | references | null: false  ,foreign_key:true|
    
Association
・belongs_to: user
