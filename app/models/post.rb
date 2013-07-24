class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  before_save :url_override

  def url_override
    self.body = nil if !self.url.nil?
  end
end
