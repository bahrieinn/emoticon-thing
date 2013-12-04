class Photo < ActiveRecord::Base
  mount_uploader :file, AmazonUploader
end
