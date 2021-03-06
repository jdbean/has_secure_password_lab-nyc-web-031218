class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    return redirect_to(controller: 'sessions', action: 'new') unless @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to '/users/homepage'
  end

  def destroy
  end
end
