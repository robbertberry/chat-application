# frozen_string_literal: true

class RoomsController < ApplicationController
  before_action :set_rooms, only: [:index, :show]
  before_action :set_single_room, only: [:show]
  before_action :set_message, only: [:show]
  before_action :set_messages, only: [:show]
  before_action :set_users, only: [:index, :show]

  def index
    redirect_to '/signin' unless @current_user
  end

  def show
    render 'index'
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      flash[:success] = "Room created #{@room.name}!"
    else
      flash[:error] = "Room could not be created due to the following errors: #{@room.errors.full_messages.join(', ')}"
    end
  end

  private

  def set_rooms
    @rooms = Room.public_rooms
  end

  def set_single_room
    @single_room = Room.find(params[:id])
  end

  def set_message
    @message = Message.new
  end

  def set_messages
    @messages = @single_room.messages.order(created_at: :asc)
  end

  def set_users
    @users = User.all_except(current_user)
  end

  def room_params
    params.require(:room).permit(:name)
  end
end
