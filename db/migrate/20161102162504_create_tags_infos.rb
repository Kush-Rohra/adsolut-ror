class CreateTagsInfos < ActiveRecord::Migration
  def change
    create_table :tags_infos do |t|
      t.integer :tag_id,null:false
      t.float :ad_request,null:false
      t.float :match_request,null:false
      t.float :clicks,null:false
      t.float :ctr,null:false
      t.float :ecpm,null:false
      t.float :partner_revenue,null:false
      t.date :frm_date,null:false
      t.date :to_date,null:false
      t.timestamps null: false
    end
  end
end
