require "open-uri"
require "nokogiri"
require "csv"

url =
html_file = URI.open("../beerstyleparse.html").read

doc = Nokogiri::HTML(html_file) # create a nokogiri doc based on that html

elements = doc.search('#beer-styles-toc h2')
elements.class
p elements

# elements.each do |element|
p elements[0].text.strip
# end

# Saving to CSV
# filepath = "data/beatles.csv"
# CSV.open(filepath, "wb") do |csv|
#   # csv << ["First Name", "Last Name", "Instrument"]
#   csv << ["John", "Lennon", "Guitar"]
#   csv << ["Paul", "McCartney", "Bass Guitar"]
#   # ...
# end
