# coding: utf-8
require 'date'

UNIT = 15

def round_by_unit(min)
  rem = min % UNIT
  (UNIT - rem > UNIT / 2.0) ? -rem : UNIT - rem
end

def position(k)
  'TKJUO'.index k
end

h = { 'T' => 0, 'K' => 0, 'J' => 0, 'U' => 0, 'O' => 0 }
d  = Date.today
work_minutes = (Time.now.to_i - Time.new(d.year, d.month, d.day, 9, 0).to_i) / 60

# 休憩時間を除く
work_minutes -= case work_minutes
                when 0..240
                  0
                when 240..660
                  60
                when 660..780
                  75
                else
                  90
                end

total_time = 0
$*[0].upcase.split(/\s*:\s*/).each do |e|
  if /(?<project>[A-Z])\s*(?<time>[0-9]+(.[0-9]+)?)/ =~ e && h[project]
    total_time += time.to_f
    h[project] = time
  end
end
r = ''

h.sort { |(k, v), (l, w)| position(k) <=> position(l) }.each do |e,f|
  minutes = (work_minutes * f.to_f / total_time).to_i
  t = (minutes + round_by_unit(minutes)) / 60.0
  r << "#{e}#{(t == t.to_i)?t.to_i: t}"
end

puts r
