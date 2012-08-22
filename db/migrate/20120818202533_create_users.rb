class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :crypted_password,  :null => false
      t.string :password_salt,     :null => false
      t.string :persistence_token, :null => false
      t.string :gender
      t.date :birthday
      t.boolean :notify_news
      t.boolean :notify_offers
      t.boolean :notify_message
      t.boolean :notify_quote
      t.boolean :notify_apppointment
      t.boolean :notify_photos
      t.boolean :notify_bill

      t.timestamps
    end
  end
end
