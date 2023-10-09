# !/bin/bash

SINK2="alsa_output.pci-0000_00_14.2"
SINK1="alsa_output.usb-C-Media_Electronics_Inc._USB_Advanced_Audio_Device-00"
ACTIVE_SINK=$(pacmd stat | awk -F": " '/^Default sink name: /{print $2}' | awk 'BEGIN{FS=OFS="."} NF--' | sed 's/alsa_output/alsa_output/g')

if [ $ACTIVE_SINK = $SINK1 ]
then
  pacmd set-default-sink $SINK2.'analog-stereo'
else 
  pacmd set-default-sink $SINK1.'iec958-stereo'
fi
