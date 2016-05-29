class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :company
      t.string :email
      t.string :phone
      t.string :address

      t.timestamps
    end
  end
end
