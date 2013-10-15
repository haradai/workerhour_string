require'date'
def q(r);(U-r>U/2.0)?-r : U-r;end
P='TKJULO'
U=15
h={}
l=0
P.each_char{|c|h[c]=0}
w=(Time.now.to_i-Date.today.to_time.to_i-32400)/60
w-=case w;when 0..239;0;when 240..659;60;when 660..780;75;else;90;end
$*[0].upcase.split(/\s*:\s*/).each{|e|(l+=$2.to_f;h[$1]=$2)if/([A-Z])\s*([0-9]+(.[0-9]+)?)/=~e&&h[$1]}
h.sort{|(k,v),(l,w)|P.index(k)<=>P.index(l)}.each{|k,v|m=(w*v.to_f/l).to_i;t=(m+q(m%U))/60.0;print k+"#{(t==t.to_i)?t.to_i: t}"}
