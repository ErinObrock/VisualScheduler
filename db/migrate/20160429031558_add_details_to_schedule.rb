class AddDetailsToSchedule < ActiveRecord::Migration
  def change
    add_column :schedules, :photo_url, :string
end
