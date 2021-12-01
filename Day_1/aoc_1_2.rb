l = File.read('input').lines.map(&:to_i)

puts l.each_with_index.reduce(0) { |s,(v,i)| s += 1 if !l[i+3].nil? && v + l[i+1] + l[i+2] < l[i+1] + l[i+2] + l[i+3]; s }
