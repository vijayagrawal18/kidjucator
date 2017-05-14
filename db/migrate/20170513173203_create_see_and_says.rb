class CreateSeeAndSays < ActiveRecord::Migration[5.1]
  def change
    create_table :see_and_says do |t|
      t.string :display_text, null: false
      t.integer :category, null: false
      t.string :audio_file, null: false
      t.timestamps
    end
  end
end
