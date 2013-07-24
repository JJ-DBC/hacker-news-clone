get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/post' do

  erb :post
end

get '/comments' do

  erb :comments
end

get '/submit' do
  # if session[:active] == true
  #   erb :submit
  # else
  #   erb :signup
  # end
  erb :create_post
end

post '/submit' do
  p params
end

################################################################################

get '/users/:id' do

  erb :user
end

get '/login' do

  erb :login
end

get '/signup' do

  erb :login
end

post '/login' do
  @user = User.authenticate(params[:user][:name], params[:user][:password])

end

post '/signup' do
  @user = User.create(name: params[:name], password_hash: params[:password])
  session[:id] = @user.id
  session[:user] = @user

  p params[:name]
  p params[:password]

  redirect "/users/#{@user.id}"
p params
end


################################################################################
