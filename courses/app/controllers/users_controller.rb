class UsersController < ApplicationController
  before_action :admin?, only: %i[index update]
  before_action :set_course, only: %i[edit update]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'Спасибо за регистрацию!'
    else
      render 'new'
    end
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path
    end
  end

  def user_params
    params.require(:user).permit(:login, :password, :admin_role, course_ids: [])
  end

  private

  def set_course
    @courses = Course.all
  end
end
