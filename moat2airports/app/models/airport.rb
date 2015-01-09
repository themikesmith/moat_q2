class Airport < ActiveRecord::Base
    searchkick autocomplete: ['name']
    acts_as_mappable :default_units => :nms,
        :lat_column_name => :latitude,
        :lng_column_name => :longitude

end
