# Monitorsetup

This script allows you to configure your monitors with xrandr. A simple layout where monitors are placed from left to right. Below or under configurations are not possible.

## Start

Any number of monitors is possible from 1 to n. Edit the information in the script according to your needs.

If you are using only one monitor "farLeft" and "farRight" will be the same. And don't forget to adjust the parameters in the for-loop.

```bash

# monitor # resolution # frequency # position # rotation # activated # primary
# detailed tiling with --pos option
left=("HDMI-0" "2560x1440" "60" "0x0" "left" "yes" "no")
middle=("DP-2" "2560x1440" "144" "1440x400" "normal" "yes" "yes")
right=("DP-0" "2560x1440" "144" "4000x0" "right" "yes" "no")

# monitor in the far left
farLeft="HDMI-0"
# monitor in the far right
farRight="DP-0"

for monitor in left[@] middle[@] right[@]
do
    ...

```

## Run

Run the script without additional parameters if you want to have full controll over the position by individual pixel.

Run the script with the "-c" option if you don't care and xrandr will calculate the position of the output relative to the output next to it.

### Why even so complicated?

Tiling monitors with "--left-of, --right-of, --above, --below, --same-as another-output" has precedence over the "--pos" parameter. That means the "--pos" option wont be computed when any of the other options is set.

Let's say you wanted to deactive a monitor on the fly. If you are using the "--pos" parameter you would have to recalculate the position of each monitor relative to the upper left corner. You would also have to manually set the values again.

## Future

I would like to add more options and make this script more versatile but therefor I will probably rewrite it in Lua or Python.