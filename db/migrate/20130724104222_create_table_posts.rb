class CreateTablePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :url
      t.string :title
      t.text :body
      t.integer :user_id
      
      t.timestamps
    end
  end
end
