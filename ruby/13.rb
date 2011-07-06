require 'pp'
require 'time'

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
	if line =~ /:/ #if line contains ':'
		key, value = line.split(':', 2)
		key.downcase!
		case key
		when 'date'		
			headers[key] = Time.parse(value)
		when 'content-length'
			headers[key] = value.to_i
		else
			headers[key] = value.strip
		end
	end
end

pp headers
