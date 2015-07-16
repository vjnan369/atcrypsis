namespace :downloader do
	desc "download a file"
	task:downloading => :environment do
    Rails.logger.info("message from task")
		 Download.delete_all
    ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'downloads'")
    urls = ["https://www.valueresearchonline.com/funds/fundSelector/fundSelectResult.asp?funcName=fees&amc=&cat=equityAll&exc=susp,dir,close&schemecode=&pg=&fType=csv", "https://www.valueresearchonline.com/funds/fundSelector/fundSelectResult.asp?funcName=return_longterm&amc=&cat=equityAll&exc=susp,dir,close&schemecode=&pg=&fType=csv","https://www.valueresearchonline.com/funds/fundSelector/fundSelectResult.asp?funcName=snapshot&amc=&cat=equityAll&exc=susp,dir,close&schemecode=&pg=&fType=csv" ]
      require 'open-uri'
    open('ValueResearch-Fees_&_Details-2015July10.csv', 'wb') do |file|
    file << open(urls[0]).read
    end
      open('ValueResearch-Return_Overview-2015July10.csv', 'wb') do |file|
    file << open(urls[1]).read
    end
      open('ValueResearch-Snapshot-2015July10.csv', 'wb') do |file|
    file << open(urls[2]).read
    end

   
    # @records = Download.all
	end
end