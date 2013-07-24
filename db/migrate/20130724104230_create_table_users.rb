class CreateTableUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.text :password_hash

      t.timestamps
    end
  end
end
