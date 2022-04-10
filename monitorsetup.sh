#!/bin/sh

# relative positon from the upper left corner
# +0+0 <=> +x+y

# don't forget to update the position if you intend to deactivate a monitor

# monitor # resolution # frequency # rotation # position # activated # primary
left=("HDMI-0" "2560x1440" "60" "right" "0x0" "yes" "no")
middle=("DP-2" "2560x1440" "144" "normal" "1440x372" "yes" "yes")
right=("DP-0" "2560x1440" "144" "left" "4000x0" "yes" "no")

partialcommand=""
finalCommand=""

for curMonitor in left[@] middle[@] right[@]
do
    i=(${!curMonitor})
    if [[ ${i[5]} == "yes" ]]; then
        
        partialcommand+=" --output ${i[0]} --mode ${i[1]} --rate ${i[2]} --rotate ${i[3]} --pos ${i[4]}"
	
        if [[ ${i[6]} == "yes" ]]; then
			
            partialcommand+=" --primary"

        fi

        if [[ ${i[3]} == "left" ]]; then
        	
                partialcommand+=" --left-of ${middle[0]}"

	fi 

	if [[ ${i[3]} == "right" ]]; then
        	
                partialcommand+=" --right-of ${middle[0]}"

	fi 

        finalCommand+="$partialcommand"
	partialcommand=""
    fi
    echo "$i[0]\n"
done

if [[ ! -z $finalCommand ]]; then
    xrandr $finalCommand
fi
