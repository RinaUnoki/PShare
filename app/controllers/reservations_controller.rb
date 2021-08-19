class ReservationsController < ApplicationController
  protect_from_forgery
  
  def index
   @reservations = Reservation.all
   @rooms = Room.all
  end

  def new
   @reservation = Reservation.new
	 end
	
	def complete
		Reservation.create!(@reservation)
	end
	
	def create
   @reservation = Reservation.new(reservation_params)
   @room = Room.find_by(params[:room_id])
   render "/reservations/show"
 end

  def show
    if @reservation.invalid?
			 render :new
		 end
  end
  
  

 def destroy
   @reservation = Reservation.find(params[:id])
   @reservation.destroy
   flash[:notice] = "予約を削除しました"
   redirect_to :user_session
 end

 private

  def reservation_params
    params.require(:reservation).permit(:StartDate, :EndDate, :person_num)
  end
  
  def room_params
   params.permit(:price)
  end
end