require 'io/console'
require 'benchmark'

class Array
  
  def my_min_slow
    default = self.first
    self.each do |el|
      return el if self.select{|el2| el > el2}.empty?
    end
    nil
  end

  def my_min_fast
    result = self.shift
    self.each do |el|
      result = el if el < result
      
    end 
    result
  end 



  def my_sub_slow
    subs = []
    for i in (0...length)
      for k in (i...length)
        subs << self[k..-1]
      end
    end
    result = subs.first.reduce(:+)
    subs.each do |el|
      temp = el.reduce(:+)
      result = temp if temp > result
    end
    result
  end
  
  
  
  def my_sub_sum_fast
    result = self[0]
    current = 0
  
    self.each do |el|
      current += el 
      result = current if current > result
      current = 0 if current < 0
    end
    result 
  end 
  
end 
 
 if __FILE__ == $PROGRAM_NAME
   list = [5, 3, -9, 8, -7, 8]
   p list.my_sub_sum_fast
  end
 #  octopus = Big_O_ctopus.new()
 #     Benchmark.benchmark(Benchmark::CAPTION, 9, Benchmark::FORMAT,
 #                        "Avg. sluggish  : ", "Avg. dominant  : ", "Avg. clever    : ","Avg fast dance : ","Avg slow dance : ") do |b|
 #      s = b.report("Tot. sluggish  : ") { octopus.sluggish_octopus(fish) }
 #      d = b.report("Tot. dominant  : ") { octopus.dominant_octopus(fish) }
 #      c = b.report("Tot. clever    : ") { octopus.clever_octopus(fish) }
 #      f = b.report("Tot. fast_dance: ") { octopus.fast_dance("left-up") }
 #      sl = b.report("Tot. slow_dance: ") { octopus.slow_dance("left-up") }
 #      [s/fish.count, d/fish.count,c/fish.count,f/8,sl/8]
 #    end
 # end