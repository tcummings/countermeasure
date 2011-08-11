class CreateBicycles < ActiveRecord::Migration
  def self.up
    create_table :bicycles do |t|
      t.string :avatar
      t.string :serial_number
      t.string :color
      t.string :make
      t.string :model
      t.integer :user_id

      t.timestamps
    end
      add_index :bicycles, :user_id
      add_index :bicycles, :created_at
  end

  def self.down
    drop_table :bicycles
  end
end
