class SessionController < ApplicationController
  def index
  end
  def create
    begin
      user = User.find_by(email: user_params['email'])
     if user&.authenticate(params[:user][:password])
     session[:user_id] = user.id
     redirect_to '/index'
   else
     flash[:error] = 'Password or email is wrong'
     redirect_to '/login'
   end
rescue Exception => err
  redirect_to "/error?#{err.message}"
  flash[:notice] = err
end
 end

 def logout
  begin
    session[:user_id] = nil
    redirect_to '/'
rescue Exception => err
  redirect_to "/error?#{err.message}"
  flash[:notice] = err
end  
 end

 private

 def user_params
   params.require(:user).permit(:password, :email)
 end
end
