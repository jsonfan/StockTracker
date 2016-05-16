class StocksController < ApplicationController

  def search
    if params[:stock]
      @stock = Stock.find_by_ticker(params[:stock]) #look for stock
      @stock ||= Stock.new_from_lookup(params[:stock]) #if the left side of pipe is true no need to check the right side
    end

    if @stock
      #render json: @stock #display what the @stock instance is
      render partial: 'lookup'
    else
      render status: :not_found, nothing: true
    end

  end

end
