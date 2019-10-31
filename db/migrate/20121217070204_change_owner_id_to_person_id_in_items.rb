class ChangeOwnerIdToPersonIdInItems < ActiveRecord::Migration[4.2]
  def up
     rename_column :items, :owner_id, :person_id
  end

  def down
    rename_column :items, :person_id, :owner_id
  end
end
