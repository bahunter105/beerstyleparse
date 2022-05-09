
raw_text = "1.5-12(3-24 EBC)
1.5-4(3-8 EBC)"

split_text = raw_text.split("\n")

src_text_array = []
ebc_text_array = []

split_text.each do |line|
  src_text_array << line.split('(')[0]
  ebc_text_array << line.split('(')[1].chomp(' EBC)')
end

src_text_array.each { |line| p line}
ebc_text_array.each { |line| p line}
