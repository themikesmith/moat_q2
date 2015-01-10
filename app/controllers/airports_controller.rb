class AirportsController < ApplicationController
    autocomplete :airport, :name, extra_data: [:faa], display_value: :airport_str, full: true
    def index
        @display = false
        search_params
        if params[:departure_query].present? && params[:arrival_query].present?
            @departure = Airport.where('name LIKE ?', "%#{Airport.parse_airport_str(params[:departure_query])}%").all
            @arrival = Airport.where('name LIKE ?', "%#{Airport.parse_airport_str(params[:arrival_query])}%").all
            # check length of search results. if multiple, prompt for user selection of one
            if @departure.length == 1 and @arrival.length == 1
                @display = true
            else
                puts @departure.inspect
                puts @arrival.inspect
                if @departure.length > 1
                    flash.now[:alert_dep] = 'You must search for one exact departure airport.'
                end
                if @arrival.length > 1
                    flash.now[:alert_arr] = 'You must search for one exact arrival airport.'
                end
                if @departure.length == 0
                    flash.now[:alert_dep] = 'You must search for an existing departure airport.'
                end
                if @arrival.length == 0
                    flash.now[:alert_arr] = 'You must search for an existing arrival airport.'
                end
            end
        end
        if @display == false
	        @departure = []
    	    @arrival = []
            if params[:submit].present? and (params[:departure_query].blank? || params[:arrival_query].blank?)
                flash.now[:alert] = 'You must specify both departing and arriving airports.'
            end
        end
    end
    private
        def search_params
            params.permit(:departure_query, :arrival_query, :submit, :utf8)
        end
end
