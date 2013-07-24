class User < ActiveRecord::Base
  has_many :comments
  has_many :posts

  validates :name, presence: true
  validates :password_hash, presence: true

  validates_uniqueness_of :name

  def self.create_login(name, password)
    my_password = BCrypt::Password.create(password)
    User.create(name: name, password_hash: my_password)
  end

  def self.validate_login(name, password_input)
    @user = User.find_by_name(name)
    password_encrypted = BCrypt::Password.new(@user.password_hash)
    password_encrypted == password_input
  end

end
