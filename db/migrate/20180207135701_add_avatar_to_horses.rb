class AddAvatarToHorses < ActiveRecord::Migration[5.1]
  def self.up
    add_attachment :horses, :avatar
  end

  def self.down
    remove_attachment :horses, :avatar
  end
end
