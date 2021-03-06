class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.text :body
      t.string :note_type
      t.references :user, foreign_key: true
      t.references :horse, foreign_key: true

      t.timestamps
    end
  end
end
