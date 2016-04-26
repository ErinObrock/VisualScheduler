class AddUserRefToSchedules < ActiveRecord::Migration
  def change
    add_reference :schedules, :user, index: true, foreign_key: true, null: false
  end
end
