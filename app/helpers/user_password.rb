def create
  @user = User.new(params[:name])
  @user.password = params[:password_hash]
  @user.save!
end
