class AddGroupIdToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :group_id, :integer
  end
end
