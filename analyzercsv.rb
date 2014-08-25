require 'csv'

CSV.foreach('C:\Users\ahoffman\Documents\TestAnalysis\node.csv') do |row|
  name = row["Test"]
  status = row["Status"] #do stuff to; test sub-groupings have '( # of tests' while supra groupings have '<[name]>'
  speed = row["Status"]
end



/\(\d+ tests\)/
