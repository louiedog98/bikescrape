require 'rubygems'
require 'yajl'
require 'csv'
require 'open-uri'


idfile = ARGV[0]

c = CSV.open idfile 
uribase = "http://a841-tfpweb.nyc.gov/bikeshare/get_station_info?point="

c.each do |row|
	uristring = uribase + row[0]
	content=open(uristring).read
	PARSER = Yajl::Parser.new

  def output_CSV(s)


  station_info = [s['id'],s['lat'],s['lon'],s['user_profile_url'],s['reason']].to_csv
  puts station_info
  File.open('getdetailsOutput.csv', 'a') do |file|
    file.puts station_info
  end

end
	
  PARSER.on_parse_complete = method(:output_CSV)
  PARSER.parse(content)

end