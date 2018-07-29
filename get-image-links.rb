require 'open-uri'

require 'csv'

#require 'nokogiri'


$stdout.sync = true

CSV.foreach(ARGV[0]) do |row|
    begin
        doc = open(row[0]).read    
        if doc.include? '"o":{"displayUrl":"'
            
            
            pre_match = doc.match(/"o":{"displayUrl":".*,"key":"o"/).to_s
            
            img = pre_match.sub(/",".*url":"/, ",").sub('"o":{"displayUrl":"','').sub('","key":"o"','').gsub("\\",'').gsub('//','http://')
            
            puts img
            #match = pre_match.match(/c1\..*_o.jpg/).to_s.gsub('\\','')
            
            tags = doc.match(/"keywords":.*","title":/).to_s.sub('"keywords":','').sub(',"title":','')
            
            #ng = Nokogiri::HTML(doc)

            #not_found = doc.match(
            open('tags.csv', 'a') { |f|
                f.puts File.basename(img) + ',' + tags
                #stdout.flush
            }
            
            
            
            
        end
        open('visit-log.csv', 'a') { |f|
            f.puts row[0]
        }
    rescue
    end
    

end

