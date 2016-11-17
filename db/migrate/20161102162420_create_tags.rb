class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :user_id,null: false
      t.integer :tag_id,null:false
      t.string :name, null: false, default: ""
      t.timestamps null: false
    end
  end
end
