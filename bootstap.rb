colors = %w(F49AC2 CB99C9 966FD6 B19CD9 B39EB5 779ECB AEC6CF 03C03C 77DD77 CFCFC4 FDFD96 836953 FFB347 C23B22 FF6961 DEA5A4 FFD1DC)

500.times do |x|
  file = File.open("canvas/row_#{x}.yml", "w")
  file.write "row_#{x}:\n"

  500.times do |y|
    file.write "    column_#{y}: #{colors.sample}\n"
  end

  file.flush
  file.close
end
