######### GET ##########

get '/' do
  # Look in app/views/index.erb
  haml :index
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

######### GET ##########

post '/:emoticon/submit' do
  photo = Photo.new(params[:photo])
  if photo.save 
    redirect '/'
  else
  end
end