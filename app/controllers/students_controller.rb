class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :edit, :update]
  skip_before_action :require_user, only: [:new, :create]
  before_action :require_same_student, only: [:edit, :update]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(set_student)
    if @student.save
      flash[:notice] = "You are successfully signed in"
      redirect_to @student
    else
      flash.now[:alert] = "There was some error"
      render 'new'
      end
  end

  def show
      
  end

  def edit

  end

  def update
    if @student.update(set_student)
      flash[:notice] = "Account update successfully"
      redirect_to @student
    else
      render 'edit'
    end
  end

  private

  def set_student
    params.require(:student).permit(:name, :email, :password, :password_confirmation)
  end

  def find_student
    @student = Student.find(params[:id])
  end

  def require_same_student
    if current_user != @student
      flash[:notice] = "You cannot edit someone else's account"
      redirect_to current_user
    end
  end

end