require "open-uri"
require "nokogiri"
require "csv"

url =
html_file = URI.open("../beerstyleparse.html").read

doc = Nokogiri::HTML(html_file) # create a nokogiri doc based on that html

data_array = []

elements = doc.search('.beer-style-descriptors')
y_count = 0
x_count = 0
# elements.class
# p elements.text

lis= elements[2].search('li')

# p lis[7].children[0].text == "\n\t\t\t\t"

lis.each do |li|

  if li.children[0].text == "\n\t\t\t\t"
    p li.children[1].text.strip
    p li.children[2].text.strip
  else
    # p li.children[0]
    p li.children[0].child.text.strip
    # p li.children[1]

    p li.children[1].text.strip
  end
end
# p lis[0].children[0].child.text
# p lis[0].children[1].text

# elements.each do |beer_description|


#   uls= beer_description.search('ul')
#   uls= elements[0].search('ul li')

#   uls.each do |ul|
#     lis = ul.search('li')

#     print element.text
#   end
# end
# Saving to CSV
# filepath = "data/beatles.csv"
# CSV.open(filepath, "wb") do |csv|
#   # csv << ["First Name", "Last Name", "Instrument"]
#   csv << ["John", "Lennon", "Guitar"]
#   csv << ["Paul", "McCartney", "Bass Guitar"]
#   # ...
# end
