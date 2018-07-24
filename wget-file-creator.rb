require 'csv'

CSV.foreach(ARGV[0]) do |row|
    puts row[0]
end
