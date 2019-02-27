#!/bin/bash

#Module1=$(ifconfig | egrep -E '^en*' | sed -r s/://gi | tr -s ' ' | cut -d ' ' -f1)
#Module2=$(ifconfig | egrep -E '^wl*' | sed -r s/://gi | tr -s ' ' | cut -d ' ' -f1)

#for i in $( ls /sys/class/net ); do echo -n $i; ethtool $i | grep Link\ d; done

if [ "$(cat /sys/class/net/enp2s0/operstate)" = "up" ]; then 
	#echo "$Module1"
    echo "\${downspeedgraph enp2s0 72,80 ff0000 0000ff} : \${upspeedgraph enp2s0 72,80 0000ff ff0000}"
else 
	#echo "$Module2"
    echo "\${downspeedgraph wlx7cdd90840a37 72,80 ff0000 0000ff} : \${upspeedgraph wlx7cdd90840a37 72,80 0000ff ff0000}"
fi