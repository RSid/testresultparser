require 'csv'

@individual_tests = []

@over_test = ""

@supra_test = ""

@overtests = []

@supratests = []

CSV.foreach('/Users/alla/Documents/programming/testresultparser-master/dataexample.csv',headers: true) do |row|
  test_for_overclass = /\(\d+ tests\)/
  test_for_supraclass = /<.+>/

  name = row["Test"]
  status = row["Status"].match(/\] .+/).to_s
  speed = row["Status"].match(/\[\d+:\d\d.\d{3}\]/).to_s

  if !(name.match(test_for_overclass)==nil)
    if !(name.match(test_for_supraclass)==nil)
      @supra_test = name

      @supratests.push(name: name, status: status, speed: speed)
    else
      @over_test = name

      @overtests.push(name: name, status: status, speed: speed, supratest: @supra_test)
    end
  else
    @individual_tests.push(name: name, status: status, speed: speed, overtest: @over_test,supratest: @supra_test)
  end
end

@individual_tests.sort!{|x,y| x[:speed] <=> y[:speed]}.reverse!

@overtests.sort!{|x,y| x[:speed] <=> y[:speed]}.reverse!

@supratests.sort!{|x,y| x[:speed] <=> y[:speed]}.reverse!

puts "10 Slowest Tests Are:"

@individual_tests[0..10].each {|x| puts x[:name], x[:speed]}
puts

puts "5 Slowest Test Groups Are:"

@overtests[0..5].each {|x| puts x[:name], x[:speed]}
puts

puts "Slowest Over-arching Group Is:"

puts @supratests[0][:name] + ',' + @supratests[0][:speed]

puts 'done!'
