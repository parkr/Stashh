class CreateColours < ActiveRecord::Migration
  def self.up
    create_table :colours do |t|
      t.timestamps
      t.string :hex
      t.string :red
      t.string :green
      t.string :blue
      t.string :alpha
      t.integer :user_id
    end
  end

  def self.down
    drop_table :colours
  end
end
