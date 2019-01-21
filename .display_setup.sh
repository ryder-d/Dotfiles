#!/usr/bin/env bash

# The xRandR names of my monitors, including the internal laptop monitor / display
readonly MON_INTERNAL='eDP-1'
readonly MON1='DP-1'
readonly MON1_FALLBACK='DP-1-8'
readonly MON2='HDMI-2'

# The resolutiond of the given xRandR monitors / displays. NOTE: $MON1 and $MON1_FALLBACK are the same display, so only one res is needed
readonly MON_INTERNAL_RES='1920x1080'
readonly MON1_RES='2560x1440'
readonly MON2_RES='1680x1050'

main_mon=''
sec_mon=''

# Store a count of how many monitors are connected
mon_count=$(xrandr -q | grep -w 'connected' | wc -l)

# Configure the monitors via xRandR
config_monitors() {
    if [[ "$#" -eq "2" ]]; then
        xrandr --output $1 --primary --mode $2 --rotate normal --pos 0x0
    elif [[ "$#" -eq "4" ]]; then
        xrandr --output $MON_INTERNAL --off --output $1 --mode $2 --pos 1680x0 --right-of $3 --output $3 --mode $4 --pos 0x0 --left-of $1
    fi
}

# Determine which main monitor is available
if [[ $mon_count -gt 1 ]]; then
    # The name of which main monitor is connected (either $MON1 or $MON1_FALLBACK)
    main_mon=$(xrandr -q | grep -w 'connected'| grep "^$MON1\|^$MON1_FALLBACK" | awk '{ print $1 }')
else # fallback to laptop display $MON_INTERNAL because the hardcoded displays aren't connected
    main_mon=$MON_INTERNAL
fi

# Determine whether the secondary HDMI monitor, $MON2 is connected
if [[ $mon_count -gt 1 ]] && [[ $(xrandr -q | grep $MON2 | awk '{ print $2 }') -eq connected ]]; then
    sec_mon=$MON2
fi

# Configure both external monitors if they're set or use the internal display
# TODO: Actual fallback logic for when HDMI display is connected but not the primary DP-x..
if [[ -n $main_mon ]] && [[ -n $sec_mon ]]; then
    config_monitors "$main_mon" "$MON1_RES" "$sec_mon" "$MON2_RES"
else
    config_monitors "$MON_INTERNAL" "$MON_INTERNAL_RES"
fi