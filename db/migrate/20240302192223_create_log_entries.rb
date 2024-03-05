class CreateLogEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :log_entries do |t|
      t.datetime :ends_at
      t.string :content
      t.string :location

      t.timestamps
    end
  end
end
