class AddAddressToAirport < ActiveRecord::Migration
  def change
    add_column :airports, :address, :string
  end
end
