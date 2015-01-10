class AddColumnsToAirport < ActiveRecord::Migration
  def change
    add_column :airports, :airport_id, :integer
    add_column :airports, :name, :string
    add_column :airports, :city, :string
    add_column :airports, :country, :string
    add_column :airports, :faa, :string
    add_column :airports, :icao, :string
    add_column :airports, :latitude, :decimal
    add_column :airports, :longitude, :decimal
    add_column :airports, :altitude, :decimal
    add_column :airports, :offset, :decimal
    add_column :airports, :dst, :string
    add_column :airports, :tz, :string
  end
end
