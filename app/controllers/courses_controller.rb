class CoursesController <  ApplicationController
  skip_before_action :require_user, only: [:index]

    def index
        @courses = Course.all
    end

    def new
        @course = Course.new
    end

    def create
        @course = Course.new(set_course)
        if @course.save
          redirect_to root_path
        else
          flash.now[:notice] = "The details of this course are incorrect"
          render 'new'
        end
    end

    private

    def set_course
      params.require(:course).permit(:short_name, :name, :description)
    end

end