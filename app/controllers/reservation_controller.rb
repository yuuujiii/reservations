class ReservationController < ApplicationController
  def index
    @user = session[:user_id]
    @reservations = Reservation.where(user_id:@user)
  end

  def new
    @params = params.require(:reservation).permit(:start_date, :end_date, :number_of_perple, :room_id, :user_id, :total_amount)
    @reservation = Reservation.new(@params)
    @room = Room.find_by(id:@params[:room_id])
    @room_price = @room.price
    @days = (@params[:end_date].to_date - @params[:start_date].to_date).to_i
    @total_amount = @days * @room_price * @params[:number_of_perple].to_i
  end

  def create
    @reservation = Reservation.new(create_params)
    if @reservation.save
      flash[:notice] = "Reservation was successfully created."
      redirect_to "/reservation/#{@reservation.id}"
    else
      render "new"
    end
  end

  def create_params
    @params = params.require(:reservation).permit(:start_date, :end_date, :number_of_perple, :room_id, :user_id, :total_amount)
  end

  def show
    @reservation = Reservation.find_by(id:params[:id])
    @room = Room.find_by(id:@reservation.room_id)
  end

end
