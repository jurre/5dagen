def get_file_as_string(filename)
  data = ''
  f = File.open(filename, "r") 
  f.each_line do |line|
    data += line
  end
  return data
end

#get input from file
input = get_file_as_string '001-simple.txt'

#create a hash
headers = {}

#create an array with lines of text
lines = input.split("\n")

lines.each do |line|
	if line =~ /:/
		key, value = line.split(':', 2)
		headers[key.downcase] = value.strip
	end
end

require 'pp'
pp headers
