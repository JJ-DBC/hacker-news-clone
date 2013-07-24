def current_user
 @user ||= User.find(session[:user_id])
end


def is_logged_in?
  !current_user.nil?
end
