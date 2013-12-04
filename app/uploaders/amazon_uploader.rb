class AmazonUploader < CarrierWave::Uploader::Base
  storage :fog
end