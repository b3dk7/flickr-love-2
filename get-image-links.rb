require 'open-uri'
require 'csv'

CSV.foreach(ARGV[0]) do |row|
    doc = open(row[0]).read    
    if doc.include? '"o":{"displayUrl":"'
        
        
        pre_match = doc.match(/"o":{"displayUrl":".*,"key":"o"/).to_s
        
        
        puts pre_match.sub(/",".*url":"/, ",").sub('"o":{"displayUrl":"','').sub('","key":"o"','').gsub("\\",'').gsub('//','http://')
        #match = pre_match.match(/c1\..*_o.jpg/).to_s.gsub('\\','')
        
        
        #not_found = doc.match(
        
        
    end
    

end

