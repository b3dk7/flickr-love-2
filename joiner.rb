#file = File.open("page1", "r")
#puts file.read



ARGV.each do |file|


    File.open(file, "r") do |f|
        f.each_line do |line|
            if !line.include? "https://www.flickr.com/search/?text=" and line != "\n"
                puts line
            end
        end
    end


end
