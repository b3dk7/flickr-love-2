require 'watir'
#require 'open-uri'
require 'csv'
#require 'nokogiri'

links_list = []


b = Watir::Browser.new :chrome
#, headless: true



CSV.foreach("lil-places") do |row|
    link = 'https://www.flickr.com/search/?text='+row[0].gsub(' ','%20')
    
    
    
    
    b.goto(link)
    

    
    divs = b.divs class: 'photo-list-photo-view'

    i = 0
    total = divs.size
    
    
    while i < total
        begin
            divs[i].click
            puts b.url
            b.goto(link)
            i+=1
        rescue
            i+=1
        end 
    end

end
