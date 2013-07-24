class User < ActiveRecord::Base
  has_many :comments
  has_many :posts

  validates :name, presence: true
  validates_uniqueness_of :name , :email
end
