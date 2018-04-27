class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :nameid
      t.integer :ordering
      t.string :Phenomenon

      t.timestamps
    end
  end
end
