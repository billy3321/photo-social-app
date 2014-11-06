class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image, :string
    add_column :users, :fb_token, :string
    add_column :users, :fb_expires_at, :datetime
  end
end
