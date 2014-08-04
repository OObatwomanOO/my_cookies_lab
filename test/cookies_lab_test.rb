require_relative '../lib/production_simulation.rb'
require 'minitest/autorun'

class TestLab < MiniTest::Unit::TestCase

 def test_that_it_produces_on_average_three_hundred_fifty_cookies_per_day_with_one_bakerystation
   @config = ProductionSimulation::ProductionConfig.new(1000, 1)
   @prod = ProductionSimulation::Production.new(@config)
   @prod.launch_production
   puts "Number of cookies produced : " + @prod.cookies_produced.to_s()
   STDOUT.flush 
   assert_equal(true, @prod.cookies_produced > 330000 && @prod.cookies_produced < 370000)
 end

end
