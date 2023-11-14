#!/bin/sh

VOLUME=$(awk -F"[][]" '/Left:/ { printf "%d", $2  }' <(amixer sget Master))
MUTED=$(pacmd list-sinks | awk '/muted/ { print $2 }')

# If there are multiple sinks, use this and replace `2` from "2 p" with `n`, where `n` is the sink number
# MUTED=$(pacmd list-sinks | awk '/muted/ { print $2 }' | sed -n "2 p")

# echo $MUTED

if [ "$MUTED" = "yes" ]; then
    echo "󰝟 0%"
elif [ "$VOLUME" -gt 50 ]; then
    echo "󰕾 $VOLUME%"
elif [ "$VOLUME" -gt 0 ]; then
    echo "󰖀 $VOLUME%"
else
    echo "󰕿 $VOLUME%"
fi