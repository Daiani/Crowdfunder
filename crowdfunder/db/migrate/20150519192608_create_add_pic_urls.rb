class CreateAddPicUrls < ActiveRecord::Migration
  def change
    create_table :add_pic_urls do |t|
      t.string :project

      t.timestamps null: false
    end
  end
end
