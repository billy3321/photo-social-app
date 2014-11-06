class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :photo
  validates_presence_of :user_id, :photo_id
end
