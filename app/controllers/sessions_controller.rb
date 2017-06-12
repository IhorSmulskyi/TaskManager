class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
      user = User.find_by(name: params[:name])
      if user and user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to tasks_url
      else
         redirect_to login_url, alert: "Check your name or password"    end
  end

  def destroy
      session[:user_id] = nil
         redirect_to login_url, notice: "You are log out"
  end
  def register
  redirect_to :controller => 'users', :action => 'create'
  end
  
end
