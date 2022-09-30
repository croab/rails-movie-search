class CreateShowThemes < ActiveRecord::Migration[7.0]
  def change
    create_table :show_themes do |t|
      t.references :show, polymorphic: true
      t.references :theme
      t.timestamps
    end
  end
end
