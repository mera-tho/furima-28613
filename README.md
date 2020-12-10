# DB設計

## usersテーブル

| Column            | Type   |  Options                 |
| ------------------|--------|--------------------------|
| nickname          | string | null: false              |
| last_name         | string | null: false              |
| first_name        | string | null: false              |
| last_name_kana    | string | null: false              |
| first_name_kana   | string | null: false              |
| birthday          | date   | null: false              |
| email             | string | null: false ,unique: true|
| encrypted_password| string | null: false              |

Association
・has_many: items
・has_many: purchases


## itemsテーブル

| Column          | Type      |  Options                     |
| ----------------|-----------|------------------------------|     
| name            | string    | null: false                  |
| price           | integer   | null: false                  |
| explanation     | text      | null: false                  |
| category_id     | integer   | null: false                  |
| condition_id    | integer   | null: false                  |
| shipping_fee_id | integer   | null: false                  |
| prefecture_id   | integer   | null: false                  |
| shipping_date_id| integer   | null: false                  |    
| user            | references| null: false foreign_key: true|    

Association
・belongs_to: user
・has_one: purchase

## purchasesテーブル

| Column       |    Type    |         Options                |
| -------------|------------|--------------------------------|
| user         | references | null: false  ,foreign_key: true|
| item         | references | null: false  ,foreign_key: true|

Association
・belongs_to: item
・belongs_to: user
・has_one: address

## addressesテーブル

| Column          | Type       |  Options                      |
| ----------------|------------|-------------------------------|
| postal_code     | string     | null: false                   |
| prefecture_id   | integer    | null: false                   |
| city            | string     | null: false                   |
| house_number    | string     | null: false                   |
| building        | string     |                               |
| telephone_number| string     | null: false                   |
| purchase        | references | null: false  ,foreign_key:true|
    
Association
・belongs_to: purchase
