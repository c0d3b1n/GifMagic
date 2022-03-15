class CreateGifs < ActiveRecord::Migration[7.0]
  def change
    create_table :gifs do |t|
      t.string :name
      t.string :description
      t.references :user
      t.timestamps
    end
  end
end
