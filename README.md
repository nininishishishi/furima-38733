
# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false unique: true |
| encrypted_password | string | null: false              |
| lastname           | string | null: false              |
| firstname          | string | null: false              |
| lastname(K)        | string | null: false              |
| firstname(k)       | string | null: false              |

### Association

- has_many :items
- has_many :purchases
- has_many :comments



## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| title              | string     | null: false |
| detail             | string     | null: false |
| category           | string     | null: false |
| condtion           | string     | null: false |
| shipping_cost      | string     | null: false |
| region             | string     | null: false |
| days               | string     | null: false |
| price              | integer    | null: false |
| commission         | integer    | null: false |
| profit             | integer    | null: false |
| user               | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :purchase
- has_many :comments



## purchases テーブル

| Column             | Type        | Options     |
| ------------------ | ----------- | ----------- |
| credit             | integer     | null: false |
| date_of_expiry     | integer     | null: false |
| security           | integer     | null: false |
| postcode           | string      | null: false |
| prefectures        | string      | null: false |
| municipalities     | string      | null: false |
| address            | string      | null: false |
| Building           | string      | null: false |
| telephone_number   | string      | null: false |
| user               | references  | null: false, foreign_key: true  |
| item               | references  | null: false, foreign_key: true  |



### Association

- belongs_to :user
- belongs_to :item




## comments テーブル

| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| comtent | text       | null: false |
| user    | references | null: false, foreign_key: true  |
| item    | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
