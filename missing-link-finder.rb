require 'csv'




my_pot = Dir.entries(ARGV[1])
my_pot = my_pot[2..-1]


CSV.foreach(ARGV[0]) do |row|
    if my_pot.index(File.basename(row[0])) == nil
        puts row[0]
    end
end
