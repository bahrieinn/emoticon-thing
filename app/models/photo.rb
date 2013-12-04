class Photo < ActiveRecord::Base
  mount_uploader :file, AmazonUploader

  def image_data=(data)
    # decode data and create stream on them
    io = CarrierStringIO.new(Base64.decode64(data))

    # this will do the thing (photo is mounted carrierwave uploader)
    self.file = io
  end

end
