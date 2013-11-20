class Photo < ActiveRecord::Base
  include Paperclip::Glue

  attr_accessible :image

  has_attached_file :image,
    :styles => {
      :medium => '640x480'
    }
end
