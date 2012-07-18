# This ruby file squeezes a bunch of javascript files into 1 javascript file
files = [
	'./public/javascripts/socket.io.js' ,
	'./public/javascripts/client.js' ,
	'./public/javascripts/mousebox.js' ,
] # files

output = File.open( "./public/javascripts/surfwithfriends.js", "a+" )
files.each do |filename|
	file = File.open( filename, "r" )
	file.each do |line|
		output.puts( line )
	end
	puts file.size.to_s + " added! \n"
end

puts "Total size: " + output.size.to_s
