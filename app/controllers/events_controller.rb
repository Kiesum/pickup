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
    # @event = Event.new(event_params)
    # @event.save
    # redirect_to event_path(@event)
    @event = Event.new()
    @event.update_attributes(latitude: params[:latitude], longitude: params[:longitude])
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
