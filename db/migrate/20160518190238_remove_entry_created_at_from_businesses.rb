class RemoveEntryCreatedAtFromBusinesses < ActiveRecord::Migration
  def change
    remove_column :businesses, :entry_created_at, :datetime
  end
end
