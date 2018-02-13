class UseDateInsteadOfTimestampForHorseDob < ActiveRecord::Migration[5.1]
  def change
    change_column :horses, :dob, :date
  end
end
