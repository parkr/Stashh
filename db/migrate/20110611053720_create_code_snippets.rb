class CreateCodeSnippets < ActiveRecord::Migration
  def self.up
    create_table :code_snippets do |t|
      t.string :name
      t.string :lang
      t.string :code
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :code_snippets
  end
end
