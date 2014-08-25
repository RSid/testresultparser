require 'csv'

CSV.foreach('C:\Users\ahoffman\Documents\TestAnalysis\node.csv') do |row|
  name = row["Test"]
  status = row["Status"] #do stuff to
  speed = row["Status"]
end



/\(\d+ tests\)/
