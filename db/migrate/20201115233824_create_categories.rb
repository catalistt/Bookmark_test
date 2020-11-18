class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.boolean :visibility
      t.references :parent
      t.timestamps
    end
  end
end
