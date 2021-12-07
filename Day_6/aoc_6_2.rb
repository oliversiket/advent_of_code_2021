lanterns_by_day = Hash.new(0)
File.read('input').split(',').map(&:to_i).each do |fish|
  lanterns_by_day[fish] += 1
end

256.times do
  zeros = lanterns_by_day[0]

  new_fish = Hash.new(0)
  lanterns_by_day.each do |d, f|
    puts "key => #{d}: value => #{f}"
    if d == 0 
      new_fish[6] += f
      new_fish[8] += f
    else
      new_fish[d-1] += f
    end
  end

  lanterns_by_day = new_fish
end

puts lanterns_by_day.values.sum
