module ProductionSimulation

  class ProductionRandom
  
	def launch_random_production
	  @result = (1+rand(6)) * 100
	  return @result
	end	
  end
							  
  class Bakerystation
	attr :stock
	attr_accessor :randomized_production	  
	
	def initialize(randomized_production=ProductionRandom.new())
	  @randomized_production = randomized_production
	  @stock = 0  
	end	  
	
	def operate
	  result = @randomized_production.launch_random_production()
	  if (result > @stock && @stock<600)
		  result=@stock
	  end	  
	  
	  @stock-=result
	  return result
	end		
	  
	def stock=(stock)
	  @stock = stock
	end
  
	def stock_size
	  @stock
	end		
	
  end
							  
  class Production
	attr_accessor :production_configs
	attr_accessor :cookies_produced
  
	def initialize(production_configs)
	  @cookies_produced = 0
	  @production_configs = production_configs
	  @stations = Array.new(production_configs.num_stations){|i|Bakerystation.new()}
	  @stations[0].stock = 100000000 # in order to make sure that the first station has always some stock available
	end
   
	def show_results()	
	  puts "\n"	  
      puts "                                      "
      puts "     .------------------------------. "
      puts "    /  _   _   _      .  __  __    /| "
      puts "   /  / \\ / \\ / \\ |_/ | |_  (__   / | "
      puts "  /   \\_  \\_/ \\_/ | \\ | |__ ,_/  /  | "	  
      puts " .______________________________.   . "
      puts " |  .--.   .--.   .--.   .--.   |   / "
      puts " | (    ) (    ) (    ) (    )  |  /  "
      puts " |  '--'   '--'   '--'   '--'   | /   "	  
      puts " '------------------------------'     "	  
	  puts "\n"		  		  
	  puts "        --------------------          "	  
	  puts "       | PRODUCTION RESULTS |         " 
	  puts "        --------------------          "
	  puts "\n"
	  puts "Number of cookies produced after " + @production_configs.num_days.to_s + " days : " + @cookies_produced.to_s
	  puts "\n"
	  puts "Bakery stations' stocks : "
      index = 1
      @stations.each do |station|
        puts "Station " + index.to_s() + " : " + station.stock_size().to_s() + " unfinished cookies"
        index=index+1
      end	  
	end
  
	def produce_one_day
	  num_out = 0
	  index = 0
	  @stations.each do |station|
		 num_out = station.operate
		 index+=1
		 if !@stations[index].nil?
		   @stations[index].stock+=num_out
		 end
	  end
	  @cookies_produced+=num_out
	end
  
	def launch_production
	  for i in 1..production_configs.num_days.to_i()
		produce_one_day()
	  end
	end	
	
  end								  
							  
  class ProductionConfig
	 attr_accessor :num_days
	 attr_accessor :num_stations
  
	 def initialize(num_days, num_stations)
		 @num_stations = num_stations
		 @num_days = num_days
	 end	    
  end	  
end