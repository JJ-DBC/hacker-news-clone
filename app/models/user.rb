class User < ActiveRecord::Base
  has_many :comments
  has_many :posts

  validates :name, presence: true
  validates :password_hash, presence: true

  validates_uniqueness_of :name

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(name, password)
    user = self.find_by_name(name)
    if user && user.password == password
      user
    else
      nil
    end
  end

end
