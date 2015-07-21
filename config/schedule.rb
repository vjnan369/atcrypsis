
set :environment, 'development'

every 1.minutes do
	rake "downloader:downloading"
end