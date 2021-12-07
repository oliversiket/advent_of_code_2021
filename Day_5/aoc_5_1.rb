class Hydrothermal
  attr_reader :coords, :input
  
  def initialize
    input = File.read('input').split("\n").map{ |x| x.gsub(/ -> /, ',') }
    @coords = input.map(&:to_i).each_slice(4).to_a
  end

  def diagnose
    print coords
  end
end

puts Hydrothermal.new.diagnose