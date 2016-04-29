class RemoveCompletedFromSchedule < ActiveRecord::Migration
  def change
    remove_column :schedules, :completed, :boolean
    change_column_null :schedules, :completed, false
  end
end
