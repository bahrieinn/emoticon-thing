class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :emoticon
    end
  end
end
