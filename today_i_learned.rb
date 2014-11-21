#!/usr/bin/env ruby

argument = ARGV.shift
message = ARGV.shift
line_number = ARGV.shift

case argument
when "add"
	file = File.open('~/what_i_learned.txt','a')
	file.write("#{Time.now.strftime('%m/%d/%y %k:%M%l.%S')}  -  #{message}\n")
	puts "Added your message."
when "show"
	file = File.open('~/what_i_learned.txt','r')
	counter = 0
	file.readlines.each do |l|
		puts "ID: #{counter}  -  #{l}"
		counter += 1
	end
when 'edit'
	file = File.open('~/what_i_learned.txt','r')
	file_new = File.open('~/what_i_learned.txt.new','w')
	counter = 0
	file.readlines.each do |l|
		if counter != line_number.to_i
			file_new.write(l)
		else
			file_new.write("#{Time.now.strftime('%m/%d/%y - %k:%M%l.%S')} - #{message}\n")
			puts 'Message edited'
		end
		counter +=1
	end
	`mv what_i_learned.txt.new what_i_learned.txt`
when 'delete'
  file = File.open('~/what_i_learned.txt','r')
  file_new = File.open('~/what_i_learned.txt.new','w')
  counter = 0
  file.readlines.each do |l|
    file_new.write(l) if counter != message.to_i
    counter +=1
  end
  `mv what_i_learned.txt.new what_i_learned.txt`
end
