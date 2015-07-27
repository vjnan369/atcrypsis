
set :environment, 'production'

every 1.day, :at => '6:00 am' do
	rake "downloader:downloading"
end