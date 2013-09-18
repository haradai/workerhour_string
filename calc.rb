require 'date'
def q(r);(U-r>U/2.0)?-r : U-r;end
def o(k);P.index k;end
P='TKJUO';U=15;h={};l=0;d=Date.today;P.each_char{|c|h[c]=0}
w=(Time.now.to_i-Time.new(d.year,d.month,d.day,9,0).to_i)/60
w-=case w;when 0..240;0;when 240..660;60;when 660..780;75;else;90;end
$*[0].upcase.split(/\s*:\s*/).each{|e|(l+=$2.to_f;h[$1]=$2)if/([A-Z])\s*([0-9]+(.[0-9]+)?)/=~e&&h[$1]};r=''
h.sort{|(k,v),(l,w)|o(k)<=>o(l)}.each{|k,v|m=(w*v.to_f/l).to_i;t=(m+q(m%U))/60.0;r<<k+"#{(t==t.to_i)?t.to_i: t}"}
puts r
