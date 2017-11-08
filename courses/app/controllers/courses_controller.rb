class CoursesController < ApplicationController
  before_action :authorize
  before_action :admin?, only: %i[new]
  def index
    @courses = current_user.courses
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to root_url, notice: 'Курс создан'
    else
      render 'new'
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :description, :user_id, :materials, :questions, user_ids: [])
  end
end
