require "open-uri"
require "nokogiri"
require "csv"

html_file = URI.open("../beerstyleparse.html").read #read url file
doc = Nokogiri::HTML(html_file) # create a nokogiri doc based on that html

data_array = []

elements = doc.search('.beer-style-descriptors')

# variables to run through the array
y_count = 0
x_count = 0

elements.each do |beer_description|

  lis= beer_description.search('li')

  sub_array = []

  lis.each do |li|
    if li.children[0].text == "\n\t\t\t\t"  # avoid nil in this specific case
      # p li.children[1].text.strip
      sub_array[x_count] = li.children[2].text.strip
    else
      # p li.children[0].child.text.strip
      sub_array[x_count] = li.children[1].text.strip
    end
    x_count += 1
  end
  data_array[y_count] = sub_array
  y_count += 1
  x_count = 0

end

# print data_array

#titles for the csv
titles = ["Color:", "Clarity:", "Perceived Malt Aroma & Flavor:", "Perceived Hop Aroma & Flavor:", "Perceived Bitterness:", "Fermentation Characteristics:", "Body:", "Additional notes:", "Original Gravity (°Plato)", "Apparent Extract/Final Gravity (°Plato)", "Alcohol by Weight (Volume)", "Bitterness (IBU)", "Color SRM (EBC)"]

# Saving to CSV
filepath = "../beerstyleparse.csv"
CSV.open(filepath, "wb") do |csv|
  csv << titles
  data_array.each do |row|
    csv << row
  end
end
