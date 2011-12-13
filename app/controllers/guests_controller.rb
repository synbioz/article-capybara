class GuestsController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @guests = @event.guests
    Rails.logger.error @guests.inspect
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @guests }
    end
  end
 end
