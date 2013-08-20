class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.datetime :date
      t.integer :nb
      t.string :link
      t.integer :manga_id

      t.timestamps
    end
  end
end
