class AirportsController < ApplicationController
    autocomplete :airport, :name, extra_data: [:faa], display_value: :airport_str, full: true
    def index
        @display = false
        search_params
        if params[:departure_query].present? && params[:arrival_query].present?
            puts 'wahoo'
            @departure = Airport.where('name LIKE ?', "%#{Airport.parse_airport_str(params[:departure_query])}%").all
            @arrival = Airport.where('name LIKE ?', "%#{Airport.parse_airport_str(params[:arrival_query])}%").all
            # check length of search results. if multiple, prompt for user selection of one
            if @departure.length > 1
                puts 'dep len > 1'
                flash.now[:alert] = 'You must search for an exact departure airport.'
            elsif @arrival.length > 1
                puts 'arr len > 1'
                flash.now[:alert] = 'You must search for an exact arrival airport.'
            else
                puts 'good.'
                @display = true
            end
        end
        if @display == false
            puts 'disp false'
	        @departure = []
    	    @arrival = []
            if params[:submit].present? and (params[:departure_query].blank? || params[:arrival_query].blank?)
                puts 'must specify flash'
                flash.now[:alert] = 'You must specify both departing and arriving airports.'
            end
        end
    end
    private
        def search_params
            params.permit(:departure_query, :arrival_query, :submit, :utf8)
        end
end