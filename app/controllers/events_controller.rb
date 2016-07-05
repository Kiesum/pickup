class EventsController < ApplicationController

  def index
    @markers = Event.all
    render :json => @markers
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
    redirect_to event_path(@event)
  end

  def show
    @event = Event.find(params[:id])
  end

  protected

  def event_params
    params.require(:event).permit(:sport, :description, :date, :start_time, :end_time, :min_num_players, :max_num_players)
  end


end
