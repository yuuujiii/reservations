class RoomsController < ApplicationController
  def index
    @user = session[:user_id]
    @rooms = Room.where(user_id:@user)
  end

  def new 
    @room = Room.new
  end

  def create
    @room = Room.new(create_params)
    if @room.save
      flash[:notice] = "Room was successfully created."
      redirect_to room_path(@room)
    else
      render "new", status: :unprocessable_entity
    end
  end

  def create_params
    params.require(:room).permit(:name, :image, :address, :introduction, :price, :user_id)
  end

  def show
    @room = Room.find_by(id:params[:id])
    @reservation = Reservation.new
  end

  def search
    if params[:area].present? && params[:keyword].present?
      @rooms = Room.where(
        "address like?", "%#{params[:area]}%"
        ).and(
        Room.where(
        "name like? or address like? or introduction like?", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%")
        )
    elsif params[:area].present?
      @rooms = Room.where("address like?", "%#{params[:area]}%")
    elsif params[:keyword].present?
      @rooms = Room.where("name like? or address like? or introduction like?", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%")
    else
      @rooms = Room.all
    end
  end

end
