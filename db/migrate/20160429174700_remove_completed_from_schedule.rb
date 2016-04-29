class RemoveCompletedFromSchedule < ActiveRecord::Migration
  def up
    remove_column :schedules, :completed, :boolean
  end
end
