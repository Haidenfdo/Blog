class UsersController < ApplicationController
  def index; end

  def create
    begin
      user = User.new(user_params)
      if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:error] = 'Email has been already taken'
      redirect_to '/signup'
    end
rescue Exception => err
  redirect_to "/error?#{err.message}"
  flash[:notice] = err
end      
  end
  private

  def user_params
    params.require(:users).permit(:name, :password, :email, :profile_image)
  end
end
