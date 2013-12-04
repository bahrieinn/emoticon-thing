class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :emoticon
      t.text :file
    end
  end
end
