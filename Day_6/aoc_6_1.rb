lanterns = File.read('input').split(',').map(&:to_i)

for i in 1..80 do
  zeros = lanterns.tally[0]

  lanterns.map! {|l|
    if l == 0 
      l = 6
    else
      l - 1
    end
  }

  unless zeros.nil?
    zeros.times do
      lanterns << 8
    end
  end
end

puts lanterns.length
