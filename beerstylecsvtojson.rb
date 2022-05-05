require 'csv'
require 'json'

filepath = "../beerstyleparse.csv"
data = File.open(filepath).read

csv = CSV.new(data, :headers => true, :header_converters => :symbol, :converters => :all)
# json_data = csv.to_a.map {|row| row.to_hash }.to_json
json_data = csv.to_a.map {|row| row.to_hash }.to_a

# p CSV.parse(data).to_json
p json_data[0]
p json_data[0].to_json
