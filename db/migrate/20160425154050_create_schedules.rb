class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :title, null: false

      t.timestamps null: false
    end
  end
end
