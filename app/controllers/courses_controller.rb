class CoursesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_course, only: [:edit, :update, :destroy, :show]


    def new
      @course = Course.new
    end

    def create
      @course = course.new(course_params)
      @course.user = current_user
      if @course.save
        redirect_to courses_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end


    def update
      @course.user = current_user
      if @course.update(course_params)
        redirect_to course_path(@course), notice: 'Upadated successfully!', status: :see_other
      else
        render :edit
      end
    end

    def destroy
      @course.destroy
      redirect_to courses_path, notice: 'course was successfully destroyed!', status: :see_other
    end

    def show
    end


    private

    def course_params
      params.require(:course).permit(:id,:name, :number_of_guests, :price, :location)
    end

    def set_course
      @course = course.find(params[:id])
    end
end
