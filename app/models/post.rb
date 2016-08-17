class Post < ActiveRecord::Base
	extend FriendlyId
	friendly_id :title, use: :slugged
  belongs_to :author , class_name: "User", foreign_key: "author_id" 
  validates :author_id , presence: true
  validates :title , presence: true , length: { maximum: 255}
  validates :body , presence: true 
  validates :description ,length: {maximum: 255}
  

end
