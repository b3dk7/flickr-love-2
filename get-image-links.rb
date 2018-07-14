require 'open-uri'
require 'csv'
require 'nokogiri'
#require 'regexp'





CSV.foreach("pages") do |row|

    
    

    
  

    
    #divs.each do |div|
        #puts div.a
        #puts div.link.name
        # div.click
        #puts b.url
        #b.goto(link)
    #end 
    
 
    
    
    #divs[5].click
    
    #puts b.url
    
    #b.goto(link)
    
    #puts b.url
    
    #puts d.location
    
    #b.links.each do |link|
     #   puts link.href
    #end
    

    doc = Nokogiri::HTML(open(row[0]))
    #links = doc.css('a')
    #puts links
    
    #here we could log inconsistencies
    if doc.text.include? "_o.jpg"
        puts "String includes '_o.jpg'"
    end
    
    
    pre_match = doc.text.match(/_o.jpg".*_o.jpg"/).to_s
    match = pre_match.match(/c1\..*_o.jpg/).to_s.gsub('\\','')
    puts match
end

