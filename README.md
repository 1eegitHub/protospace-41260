# usersテーブル
| title              | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| profile            | text   | null: false               |
| occupation         | text   | null: false               |
| position           | text   | null: false               |

# Association
has_many :prototypes
has_many :comments

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

# prototypesテーブル
| title      | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| catch_copy | text       | null: false                    |
| concept    | text       | null: false                    |
| user       | references | null: false, foreign_key: true |

# Association
has_many :users
has_many :comments

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

# commentsテーブル
| title     | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| prototype | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

# Association
has_many :users
has_many :prototypes