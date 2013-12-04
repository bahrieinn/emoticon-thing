
get '/' do
  # Look in app/views/index.erb
  p ENV['AWS_S3_BUCKET']  
  haml :index
end

get '/search' do

  redirect "/" + CGI.escape(params[:emoticon])
end

get '/:emoticon' do
  @escaped_emoticon = CGI.escape(params[:emoticon])
  haml :result
end