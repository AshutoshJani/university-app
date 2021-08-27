class LoginController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]

  def new

  end

  def create
    student = Student.find_by(email: params[:login][:email])
    if student && student.authenticate(params[:login][:password])
      session[:id] = student.id
      flash[:notice] = "You have successfully logged in"
      redirect_to student
    else
      flash.now[:notice] = "Your login credentials were incorrect"
      render 'new'
    end
  end

  def destroy
    session[:id] = nil
    flash[:notice] = "You have successfully logged out"
    redirect_to root_path
  end

end