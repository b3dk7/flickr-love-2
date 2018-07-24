require 'watir'
#require 'open-uri'
require 'csv'
#require 'nokogiri'

links_list = []
timeout = 300

$b = Watir::Browser.new :chrome, headless: true



CSV.foreach("places-10.csv") do |row|
    begin
        
        
        
        
        link = 'https://www.flickr.com/search/?text='+row[0].gsub(' ','%20')
        
        
        
        
        $b.goto(link)
        
        open('log/visits', 'a') do |f|
            f.puts row[0]
        end
        

        
        divs = $b.divs class: 'photo-list-photo-view'

        i = 0
        total = divs.size
        
        
        while i < total
            begin
                divs[i].click
                puts $b.url
                $b.goto(link)
                i+=1
            rescue
                i+=1
            end 
        end
    rescue
        
        open('log/pages.log', 'a') do |f|
            f.puts "unable to download: " + row[0]
        end
        
        #https://www.google.com/?gws_rd=ssl
        $b.close
        $b = Watir::Browser.new :chrome, headless: true
        
    end

end
