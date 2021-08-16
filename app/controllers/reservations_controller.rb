class ReservationsController < ApplicationController
  protect_from_forgery
  
  def index
   @reservations = Reservation.all
   @rooms = Room.all
  end

  def new
   @reservation = Reservation.new
   @room = Room.find_by(params[:id])
	 end
  
 def back
		@reservation = Reservation.new(@attr)
		render :new
	end
	
	def complete
		Reservation.create!(@attr)
	end

  def show
   @room = Room.find_by(room_params)
   @reservation = Reservation.find_by(@attr)
    if @reservation.invalid?
			 render :new
		 end
  end
  
 def create
   @reservation = Reservation.new(reservation_params)
   if @reservation.save
   flash[:notice] = "予約完了しました。"
   redirect_to "/reservations/show"
   else
   render "new"
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
   @attr = params.require("reservation").permit(:StartDate, :EndDate, :person_num)
  end
  
  def room_params
   params.permit(:price)
  end
end