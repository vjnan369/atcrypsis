
set :environment, 'development'

every 1.day,:at=>"2:55 pm" do
	rake "downloader:downloading"
end
