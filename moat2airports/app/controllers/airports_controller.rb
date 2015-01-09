class AirportsController < ApplicationController
    def index
        search_params
        if params[:query].present? && params[:arrival_query].present?
            @display = true
            @departure = Airport.search params[:query], load: true
            @arrival = Airport.search params[:arrival_query], load: true
        else
            @display = false
	    @departure = []
	    @arrival = []
            if params[:submit].present? and (params[:query].blank? || params[:arrival_query].blank?)
                flash.now[:alert] = 'You must specify both departing and arriving airports.'
            end
        end
    end
    def autocomplete
        render json: Airport.search(params[:q], autocomplete: "on", limit: 10).map(&:name)
    end
    private
        def search_params
            params.permit(:query, :arrival_query)
        end
end
