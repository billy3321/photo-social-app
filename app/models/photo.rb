class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :comment_users, :through => :comments, :source => :user
  validates_presence_of :user_id

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
