require_relative 'lib/production_simulation.rb'

puts "\n"	
puts "         *** WELCOME TO MY COOKIES LABORATORY ***"	
puts "\n"	  
puts "    _..._               _..._               _..._"
puts " .' _   _ '.         .' _   _ '.         .' _   _ '."
puts "/  (.) (.)  \\       /  (.) (.)  \\       /  (.) (.)  \\"
puts "|           |       |           |       |           |"
puts "\\   '---'   /       \\   '---'   /       \\   '---'   /"
puts "  '._____.'           '._____.'           '._____.'"
puts "\n"
puts "\nThis game simulates a COOKIES LABORATORY with multiple sequential bakery stations."
puts "\nIn a given day, the bakery work will be processed through the successive bakery stations,\nand each station can partially prepare from 100 to 600 biscuits per day."
puts "\nOf course, if the first bakery station processes only 500 cookies on day one,\nthe second bakery station can only process, at maximum, 500 cookies,\nbecause it only has 500 partially prepared cookies available to work on."
puts "\nExperiment with different values to see how the laboratory operates."
puts "\n"

print "For how many days do you want to produce cookies ? "
STDOUT.flush
num_days = gets
puts "\n"
print "How many different and successive bakery stations do you want to run ? "
STDOUT.flush
num_stations = gets

config = ProductionSimulation::ProductionConfig.new(num_days.to_i(), num_stations.to_i())
prod = ProductionSimulation::Production.new(config)
prod.launch_production()
prod.show_results()