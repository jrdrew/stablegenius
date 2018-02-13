class AddDayOfWeekToTurnOut < ActiveRecord::Migration[5.1]
  def change
    add_column :turn_outs, :day_of_week, :integer
  end
end
