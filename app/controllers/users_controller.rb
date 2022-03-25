class UsersController < ApplicationController
  
  def top
  end

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(create_params)
    if @user.save
      redirect_to root_path
      flash[:notice] = "Welcome! You have signed up successfully."
    else
      render "new"
    end
  end

  def create_params
    params.require(:user).permit(:name, :email, :passward, :password, :password_confirmation)
  end

  def sign_in_form
  end

  def sign_in
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "Signed in successfully."
      redirect_to root_path
    else
      render = "sign_in"
      flash[:now] = "Invalid Email or password."
    end
  end

  def log_out
    log_out if logged_in?
  end


end
