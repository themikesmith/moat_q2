# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#  import from csv file :: 
#  http://openflights.org/data.html
require 'csv'
CSV.foreach('lib/assets/airports.dat', :headers => true) do |row|
    Airport.create!(row.to_hash) if row[3] == 'United States'
    print row.inspect if row[3] == 'United States'
end
