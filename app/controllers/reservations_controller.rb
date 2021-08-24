class ReservationsController < ApplicationController
  
  def index
    @reservations =Reservation.all
    @rooms = Room.all
  end
 
  def new
    @reservation = Reservation.new
    @room = Room.find(params[:room_id])
  end
 
  def create
   @reservation = Reservation.new(reservation_params)
  #@room = Room.find(params[:room_id])
  render :new
  if @reservation.save
     return reservations_path(@reservation), notice: "予約をしました"
  end
  end
 
  def show
    @reservation = Reservation.find(params[:id])
    @room = Room.find_by(params[:room_id])
  end
 
  def edit
    @reservation = Reservation.find(params[:id])
  end
 
  def update
    @reservation = Reservation.find(params[:id])
  if @reservation.update(reservation_params)
    redirect_to reservation_path(@reservation), notice: "更新しました。"
    else
      render :edit
    end
  end
 
  def destroy
    reservation = Reservation.find(params[:id])
    reservation.destroy
    redirect_to reservations_path, notice: "予約を削除しました。"
  end
  
  private
  def reservation_params
    params.require(:reservation).permit(:StartDate, :EndDate, :person_num, :room_id, :user_id)
  end
end