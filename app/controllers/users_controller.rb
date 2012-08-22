class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :show

  def new
    @user = User.new
  end

  def create
    @user = User.new_save_password(params[:user])
    if @user.save
      flash[:notice] = "Account created!"
      redirect_back_or_default user_url
    else
      render :action => :new
    end
  end

  def show
    crash
  end
end
