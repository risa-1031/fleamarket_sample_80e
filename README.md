# README fleamarket_sample_80e DB設計

フリマアプリのクローンサイト。誰でも簡単に売り買いが楽しめるフリマアプリの機能を再現したページ。 ユーザー登録、商品出品、商品購入などの機能が再現されていますが、実際の取引はできません。

## リンク
・IPアドレス：http://18.180.31.233/

Basic認証をかけています。ご覧の際は以下のIDとPassを入力してください。

・Basic認証
  ◦ID: m80teame
  ◦Pass: otnm80


## テストユーザー

◯ 購入者用

  ◦メールアドレス：test@gmail.com
  ◦パスワード：testtest

◯ 購入用カード情報

  ◦番号：4242424242424242
  ◦期限：1/25
  ◦セキュリティコード：123

◯ 出品者用

  ◦メールアドレス：hanako@gmail.com
  ◦パスワード：hanako1


## :ペーパークリップ: 主な使用言語

![mysql_icon](https://user-images.githubusercontent.com/67986432/91398477-1b993880-e877-11ea-89dc-ac4af385b379.png), size: 100x100
<!-- MYSQLのロゴ -->
![linux](https://user-images.githubusercontent.com/67986432/91398690-8ba7be80-e877-11ea-8902-92e9c1f42798.jpg), size: 100x100
<!-- Linuxのロゴ -->
![jquery-logo](https://user-images.githubusercontent.com/67986432/91398332-dd037e00-e876-11ea-9dde-ed14764ad808.png), size: 100x100
<!-- jQueryのロゴ -->
![js](https://user-images.githubusercontent.com/67986432/91398289-c78e5400-e876-11ea-9d71-3c666e8ca090.png), size: 100x100
<!-- javascriptのロゴ -->
![saas-457964](https://user-images.githubusercontent.com/67986432/91398121-ad547600-e876-11ea-856c-c4e6035f3bac.png), size: 100x100
<!-- Scssのロゴ -->
![rails-logo](https://user-images.githubusercontent.com/67986432/91397825-97df4c00-e876-11ea-9390-faa3aa0a62ca.png), size: 100x100
<!-- RubyOnRailsのロゴ -->
![logo](https://user-images.githubusercontent.com/67986432/91396866-4e8efc80-e876-11ea-9bab-980dda445ce9.png), size: 100x100
<!-- rubyのロゴ -->
![haml](https://user-images.githubusercontent.com/67986432/91393627-3f5b7f00-e875-11ea-825e-2dbf186f4f62.png), size: 100x100
<!-- hamlのロゴ -->
![AWS](https://user-images.githubusercontent.com/67986432/91391018-82692280-e874-11ea-8928-04d0babf5f18.jpg), size: 100x100
<!-- AWSのロゴ -->









This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 6.0.0

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## users
|Column|Type|Options|
|------|----|-------|
|birth_date|date|null: false|
|name|string|null:false|
|email|string|null: false, default: ""|
|encrypted_password|string|null: false, default:""|
|reset_password_token|string|null: false|
### Association
- has_one :address
- has_one :card
- has_many :productions


## card
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
- belongs_to :user


## images
|Column|Type|Options|
|------|----|-------|
|production_id|references|null: false, foreign_key: true|
|src|strings|null:false|
### Association
- belongs_to :production


## productions
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|name|string|null: false|
|category_id|integer|null: false, foreign_key:true|
|price|integer|null: false|
|introduction|text|null: false|
|purchaser_id|references|foreign_key: true|
|size|string|null: false|
|shipping_charge|string|null: false|
|prefecture_code|string|null: false|
|detail_date|string|null: false|
|trading_status|string|null: false|
### Association
- belongs_to :category
- belongs_to :user, foreign_key: 'user_id'
- has_many :images, dependent: :destroy
- accepts_nested_attributes_for :images,
  allow_destroy:true


## category
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
### Association
- has_many :productions
- has_ancestry


## addresses
|Column|Type|Options|
|------|----|-------|
|address_first_name|string|null: false|
|address_family_name|string|null: false|
|address_first_name_kana|string|null: false|
|address_family_name_kana|string|null: false|
|post_code|integer|null: false|
|prefecture_code|integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string||
|phone_number|string|null: false, unique: true|
|user_id|string|null: false, foreign_key: true|
### Association
- belongs_to :user, optional: true


## purchase
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|production_id|references|foreign_key: true|
### Association
- belongs_to :user
- belongs_to :card
- belongs_to :production


## customer
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
### Association
- belongs_to :user


