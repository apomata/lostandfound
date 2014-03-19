class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.integer :category
      t.string :owner

      t.timestamps
    end
  end
end
