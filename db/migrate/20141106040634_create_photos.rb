class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.belongs_to :user
      t.text :content
      t.timestamps null: false
    end
  end
end
