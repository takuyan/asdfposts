class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.text :body
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :posts, :user_id
  end
end
