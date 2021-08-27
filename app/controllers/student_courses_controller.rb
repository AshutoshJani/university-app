class StudentCoursesController < ApplicationController

  def create
    course = Course.find(params[:course_id])
    unless current_user.courses.include?(course)
      StudentCourse.create(course_id: course.id, student_id: current_user.id)
      flash[:notice] = "You have successfully enrolled in the #{course.name} course"
      redirect_to root_path
    else
      flash[:notice] = "Something went wrong in your request"
      redirect_to root_path
    end
  end

end