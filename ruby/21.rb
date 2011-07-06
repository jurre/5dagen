require 'rubygems'
require 'chunky_png'

# Creating an image from scratch, save as an interlaced PNG
image = ChunkyPNG::Image.new(64, 65, ChunkyPNG::Color::BLACK)
image.line(0, 32, 63, 32, ChunkyPNG::Color.rgba(255, 255, 255, 255))

File.readlines('001-sinus.txt').each_with_index do |line, index|
	line = line.to_i
	line = 32 + ((line / 100.0) * 31).round 
	image.line(index, 32, index, line, ChunkyPNG::Color.rgba(255, 255, 255, 100))
end

image.save('square.png', :interlace => true)
