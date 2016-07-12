class EventsController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def index
    @markers = Event.all
    render :json => @markers
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new()
    @event.update_attributes(sport: params[:sport], min_num_players: params[:min_num_players], max_num_players: params[:max_num_players], latitude: params[:latitude], longitude: params[:longitude], start_time: params[:start_time], end_time: params[:end_time], date: params[:date])
    @user = User.find(current_user.id)
    @event.users << @user
    @event.save
    redirect_to "/"
  end

  def show
    @event = Event.find(params[:id])
  end

  protected

  def event_params
    params.require(:event).permit(:sport, :description, :latitude, :longitude, :date, :start_time, :end_time, :min_num_players, :max_num_players)
  end


end
