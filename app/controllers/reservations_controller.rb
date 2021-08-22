class ReservationsController < ApplicationController
  
  def index
    
  end
 
  def new
    @reservation = Reservation.new
    @room = Room.find(params[:room_id])
  end
 
  def create
  @reservation = Reservation.new(params.require(:reservation).permit(:StartDate, :EndDate, :person_num, :room_id, :user_id))
  @room = Room.find_by(params[:room_id])
  
  #if @reservation.save
    #flash[:notice] = "予約をしました"
    #redirect_to :rooms
  #else
    render "reservations/show"
  #end
  end
 
  def show
    @reservation = Reservation.find(params[:id])
  end
 
  def edit
    @reservation = Reservation.find(params[:id])
  end
 
  def update
    @reservation = Reservation.find(params[:id])
    @reservation = Reservation.new(params.require(:reservation).permit(:StartDate, :EndDate, :person_num, :room_id, :user_id))
  if @reservation.save
    flash[:notice] = "予約をしました"
    redirect_to :rooms
  else
    render "edit"
  end
  end
 
  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to :rooms
  end

end