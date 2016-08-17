class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title , null: false
      t.text :body, null: false
      t.integer :author_id, null: false
      t.string :description
      t.string :slug ,null: false
      t.timestamps null: false
    end
   
  end
end
