class AddExpirationToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :expiration, :string
  end
end
