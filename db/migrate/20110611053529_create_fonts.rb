class CreateFonts < ActiveRecord::Migration
  def self.up
    create_table :fonts do |t|
      t.string :url
      t.string :photo
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :fonts
  end
end
