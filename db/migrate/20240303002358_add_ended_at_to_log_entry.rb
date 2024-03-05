class AddEndedAtToLogEntry < ActiveRecord::Migration[7.1]
  def change
    add_column :log_entries, :ended_at, :datetime
  end
end
