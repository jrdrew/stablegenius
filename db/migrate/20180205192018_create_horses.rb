class CreateHorses < ActiveRecord::Migration[5.1]
  def change
    create_table :horses do |t|
      t.string :name
      t.string :breed
      t.string :reg_number
      t.string :owner
      t.string :job
      t.string :microchip
      t.string :usef
      t.string :usof
      t.string :neda
      t.timestamp :dob

      t.timestamps
    end
  end
end
