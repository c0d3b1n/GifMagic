class CreateGifsAndTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :name
      t.timestamps
    end

    create_table :gifs_tags, id: false do |t|
      t.belongs_to :tag
      t.belongs_to :gif
    end
  end
end
