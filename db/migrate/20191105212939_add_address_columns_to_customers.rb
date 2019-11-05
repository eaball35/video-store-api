class AddAddressColumnsToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :address, :string
    add_column :customers, :city, :string
    add_column :customers, :state, :string
  end
end
