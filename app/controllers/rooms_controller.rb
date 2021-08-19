class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      redirect_to room_path(@room), notice: "ルームを投稿しました。"
    else
      render :new
    end
  end

  def edit
    @room = Room.find(params[:id])
    if @room.user != current_user
    redirect_to rooms_path, alert: "不正なアクセスです。"
    end
  end
  
  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to room_path(@room), notice: "更新しました。"
    else
      render :edit
    end
  end
  
  private
  def room_params
    params.require(:room).permit(:title, :body, :image, :price, :adress)
  end
end
