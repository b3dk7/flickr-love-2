require 'csv'


CSV.foreach("world-cities_csv.csv") do |row|
  puts row[0]
end
