class CreatePassphrases < ActiveRecord::Migration
  def change
    create_table :passphrases do |t|
      t.integer :user_id, null: true
      t.string :password_digest, null: false
      t.timestamps null: false
    end
  end
end
