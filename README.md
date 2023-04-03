
# テーブル設計

## users テーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| nickname           | string  | null: false              |
| email              | string  | null: false unique: true |
| encrypted_password | string  | null: false              |
| lastname           | string  | null: false              |
| firstname          | string  | null: false              |
| lastname_kana      | string  | null: false              |
| firstname_kana     | string  | null: false              |
| birthday           | integer | null: false              |

### Association

- has_many :items
- has_many :historys
- belongs_to :delivery
 <!-- - has_many :comments -->



## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| title              | string     | null: false |
| detail             | text       | null: false |
| category_id        | integer    | null: false |
| condtion_id        | integer    | null: false |
| shipping_cost_id   | integer    | null: false |
| prefectures_id     | integer    | null: false |
| days_id            | integer    | null: false |
| price              | integer    | null: false |
| user               | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :history
<!-- # - has_many :comments -->



## historys テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| user       | references | null: false, foreign_key: true  |
| item       | references | null: false, foreign_key: true  |
| delivery   | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery



## deliverys テーブル

| Column             | Type        | Options     |
| ------------------ | ----------- | ----------- |
| postcode           | string      | null: false |
| prefectures_id     | integer     | null: false |
| municipalities     | string      | null: false |
| address            | string      | null: false |
| building           | string      |             |
| telephone_number   | string      | null: false |
| user_id            | references  | null: false, foreign_key: true  |




### Association

- belongs_to :user
- belongs_to :history




<!-- ## comments テーブル

| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| content | text       | null: false |
| user    | references | null: false, foreign_key: true  |
| item    | references | null: false, foreign_key: true  |

### Association

# - belongs_to :user
# - belongs_to :item -->
