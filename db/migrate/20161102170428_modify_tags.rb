class ModifyTags < ActiveRecord::Migration
  def change
    remove_column :tags,:tag_id
  end
end
