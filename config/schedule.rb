
set :environment, 'production'

every 1.minutes do
	rake "downloader:downloading"
end