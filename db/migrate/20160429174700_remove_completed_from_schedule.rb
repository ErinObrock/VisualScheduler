class RemoveCompletedFromSchedule < ActiveRecord::Migration
  def change
    remove_column :schedules, :completed, :boolean
  end
end
