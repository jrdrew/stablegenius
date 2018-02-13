class CreateTurnOuts < ActiveRecord::Migration[5.1]
  def change
    create_table :turn_outs do |t|
      t.string :instructions
      t.references :field, foreign_key: true
      t.string :time_of_day
      t.references :horse, foreign_key: true
      t.integer :number_of_minutes

      t.timestamps
    end
  end
end
