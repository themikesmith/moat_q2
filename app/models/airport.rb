class Airport < ActiveRecord::Base
    acts_as_mappable :default_units => :nms,
        :lat_column_name => :latitude,
        :lng_column_name => :longitude
    
    def airport_str
        return "#{self.name} (#{self.faa})"
    end
    def self.parse_airport_str(str)
        m = str.match(/(.*)\s\(*.*/)
        return m[1]
    end
end
