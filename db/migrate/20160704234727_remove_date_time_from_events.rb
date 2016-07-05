class RemoveDateTimeFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :datetime, :datetime
  end
end
