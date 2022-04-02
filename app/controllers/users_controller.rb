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
    binding.pry
    if @user.save
      redirect_to root_path
      flash[:notice] = "Welcome! You have signed up successfully."
      session[:user_id] = @user.id
    else
      render "new", status: :unprocessable_entity
    end
  end

  def create_params
    params.require(:user).permit(:name, :email, :passward, :password, :password_confirmation, :image)
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
      flash.now[:alert] = "メールアドレスかパスワードが違います"
      render "sign_in_form"
    end
  end

  def log_out
    session[:user_id] = nil
    flash[:notice] = "Signed out successfully."
    redirect_to root_path
  end

  def acount
    @user = User.find_by(id:session[:user_id])
  end

  def edit
    @user = User.find_by(id:session[:user_id])
  end

  def update
    @user = User.find_by(id:session[:user_id])
    binding.pry
    if @user.update(params.require(:user).permit(:password_confirmation, :email, :password, :password_digest))
      flash[:notice] = "Your account has been updated successfully."
      redirect_to root_path
      binding.pry
    else
      render "edit", status: :unprocessable_entity
      binding.pry
    end
  end

  def profile
    @user = User.find_by(id:session[:user_id])
  end

  def update_profile
    @user = User.find_by(id:session[:user_id])
    binding.pry
    if @user.update(params.permit(:image, :name, :introduction))
      flash[:notice] = "Your account has been updated successfully."
      redirect_to root_path
      binding.pry
    else
      render "profile"
      binding.pry
    end
  end

end
