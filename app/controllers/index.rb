######### GET ##########

get '/' do
  # Look in app/views/index.erb
  haml :camera
end

get '/search' do
  redirect "/" + CGI.escape(params[:emoticon])
end

get '/:emoticon/submit' do
	haml :submit
end

get '/:emoticon' do
  @escaped_emoticon = CGI.escape(params[:emoticon])
  haml :result
end

######### POST ##########

post '/:emoticon/submit' do
  if request.xhr?
    parsedData = JSON.parse(request.body.read)

    photo = Photo.new
    photo.image_data = parsedData['image']    
    p photo.file
    photo.save

  end
end

