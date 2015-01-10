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
#file = File.open("airport_names.json", "w")
#file.puts "["
CSV.foreach('lib/assets/airports.dat', :headers => true) do |row|
    if row[3] == 'United States' and row[4].present?
        Airport.create!(row.to_hash) if row[3] == 'United States' and row[4].present?
        #file.puts "#{row[1]},"
    end
end
#file.puts "]"
#file.flush
#file.close
