#! /bin/bash

# Fetching slave id and status
slave_id=$(xinput list | grep "AT Translated Set 2 keyboard" | awk '{ print $7 }' | grep -o -E '[0-9]+')
status=$(xinput list | grep "AT Translated Set 2 keyboard" | awk '{ print $8 }')

if [ $status == "[floating" ]
then
master_id=$(xinput list | grep "Virtual core keyboard" | awk '{ print $5 }' | grep -o -E '[0-9]+')
xinput reattach $slave_id $master_id
notify-send "Clean Mode OFF" -u low
elif [ $status == "[slave" ]
then
master_id=$(xinput list | grep "AT Translated Set 2 keyboard" | awk '{ print $10 }' | grep -o -E '[0-9]+')
xinput float $slave_id
notify-send "Clean Mode ON"
fi