class CreateProductions < ActiveRecord::Migration[6.0]
  def change
    create_table :productions do |t|
      t.string :user_id, null: false, foreign_key: true
      t.string :namestring, null: false
      t.integer :category_id, null: false, foreign_key: true
      t.integer :brand_id, null: false, foreign_key: true
      t.string :price, null: false
      t.text :introduction, null: false
      t.string :production_status, null: false
      t.string :size, null: false
      t.string :shipping_charge, null: false
      t.integer :prefecture_code, null: false
      t.string :shipping_method, null: false
      t.string :detail_date, null: false
      t.string :trading_status, null: false
      t.integer :production_img_id, null:false, foreign_key: true
      t.timestamps
    end
  end
end