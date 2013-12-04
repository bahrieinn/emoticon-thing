class CarrierStringIO < StringIO
  def original_filename
    "#{Time.now}#{Math.rand(99999)}.jpeg"
  end
  def content_type
    "image/jpeg"
  end
end