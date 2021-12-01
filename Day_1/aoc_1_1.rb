l = File.read('input').lines.map(&:to_i)

puts l.each_with_index.reduce(0) { |s,(v,i)| s += 1 if v > l[i - 1] && i != 0; s }