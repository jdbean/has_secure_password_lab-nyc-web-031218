class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    # byebug
    if @user.save
      # flash[:success] = "Post successfully created"
      session[:user_id] = @user.id
      redirect_to '/users/homepage'
    else
      redirect_to '/users/new'
    end

  end

  def homepage

    return head(:forbidden) unless session.include? :user_id
  end

private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
