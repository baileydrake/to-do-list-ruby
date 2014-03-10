require 'date'

dates = ["2013-12-23", "2013-01-23", "2013-07-05"]

dates.map! {|time| Date.parse(time)}

dates.sort!



dates.each do |e|
   puts e.month.to_s + "/" + e.day.to_s + "/" + e.year.to_s
end



