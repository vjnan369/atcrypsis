namespace :downloader do
	desc "download a file"
	task:downloading => :environment do
    Rails.logger.info("message from task")
    Download.destroy_all
   ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'downloads'")
#ActiveRecord::Base.connection.reset_pk_sequene!('Download')
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



    require 'csv'
    major = CSV.read('ValueResearch-Fees_&_Details-2015July10.csv')
    (2..13).each do |i|
      major.each{|each| each.push('')}
      file = CSV.read('ValueResearch-Return_Overview-2015July10.csv')
      file.each do |line|
        temp = major.assoc(line[0])
        temp[-1] = line[i]
      end
    end

    (2..3).each do |i|
      major.each{|each| each.push('')}
      file = CSV.read('ValueResearch-Snapshot-2015July10.csv')
      file.each do |line|
        temp = major.assoc(line[0])
        temp[-1] = line[i]
      end
    end


    major.each{|each| each.push('')}
      file = CSV.read('ValueResearch-Snapshot-2015July10.csv')
      file.each do |line|
        temp = major.assoc(line[0])
        temp[-1] = line[7]
      end

    csv = CSV.open('output.csv','wb') #opens output csv file for writing
    major.drop(2).each {|each| csv << each}


      counting=0
    temp=[]
csv = CSV.open('output2.csv','wb')
        sam = CSV.read('output2.csv')
        (0..21).each do |i|
          sam.each{|each| each.push('')}
          file = CSV.read('output.csv')
          file.each do |line|
          temp = major[0]
          temp[-1] = line[i]
          end
        end
=begin
    major2 = CSV.read('output.csv')
    csv2 = CSV.open('output2.csv','wb')
    major2.each{|ch| csv2 << ch}
    someone=0
    major2.each{|ch| someone+=1}
    puts someone
=end
   
      csv = CSV.open('output2.csv','wb')
       sam = CSV.read('output2.csv')
    
        (0..21).each do |i|
         sam.each{|each| each.push('')}
          file = CSV.read('output.csv')
        end
         
    csv_text = File.read('output.csv')
    #puts File.read('output.csv').length
    csv = CSV.parse(csv_text, :headers => :true)
    #puts CSV.parse(csv_text, :headers => :true).length
    csv.each do |row|
    Download.create!(:fund => row['Fund'],:rating => row['Rating'],:minimum_investment=>row['Minimum Investment (Rs)'],:exit_load=>row['Exit Load (Period)'],
      :expense_ratio=>row['Expense Ratio'],:portfolio_manager=>row['Portfolio Manager (Tenure)'],:one_month_return=>row['1-Month Return'],:one_month_rank=>row['1-Month Rank'],:three_month_return=>row['3-Month Return'],
      :three_month_rank=>row['3-Month Rank'],
      :one_year_return=>row['1-Year Return'],:one_year_rank=>row['1-Year Rank'],:three_year_return=>row['3-Year Return'],:three_year_rank=>row['3-Year Rank'],
      :five_year_return=>row['5-Year Return'],:five_year_rank=>row['5-Year Rank'],:ten_year_return=>row['10-Year Return'],
      :ten_year_rank=>row['10-Year Rank'],:category=>row['Category'],:launch=>row['Launch'],:net_assets=>row['Net Assets (Cr)'])
     
    end
    # @records = Download.all
	end
end