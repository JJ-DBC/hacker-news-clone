get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/posts/:id' do

  erb :post
end

get '/comments' do

  erb :comments
end

get '/submit' do
  if session[:user_id]
    erb :create_post
  else
    erb :signup
  end
end

post '/submit' do

  current_user.posts.create(params[:post])

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
  if User.validate_login(params[:name], params[:password])
    @user = User.find_by_name(params[:name])

    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    redirect '/login'
  end
end

post '/signup' do
  # @user = User.create(name: params[:name], password_hash: params[:password])
  @user = User.create_login(params[:name], params[:password])

  session.clear
  
  session[:user_id] = @user.id
  redirect "/users/#{@user.id}"
end


################################################################################
