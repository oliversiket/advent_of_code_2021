s = File.read('input').split(',').map(&:to_i)
fuel_count = Hash.new(0)

#task1
s.min..s.max.times do |i|
  s.each do |s|
    if s > i
      fuel_count[i] += s - i
    elsif s == i
      fuel_count[i] += 0
    else
      fuel_count[i] += (s - i).abs()
    end
  end

  fuel_count
end

puts "minimum fuel: #{fuel_count.min_by(&:last)[1]}"

#task2
s.min..s.max.times do |i|
  s.each do |s|
    if s > i
      fuel_count[i] += (1..s-i).sum
    elsif s == i
      fuel_count[i] += 0
    else
      fuel_count[i] += (1..i-s).sum.abs()
    end
  end

  fuel_count
end

puts "minimum fuel: #{fuel_count.min_by(&:last)[1]}"