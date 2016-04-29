class AddDetailsToSchedule < ActiveRecord::Migration
  def change
    add_column :schedules, :photo_url, :string, null: false
end
