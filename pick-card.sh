#!/bin/bash
# pick-card.sh

# This is an example of choosing random elements of an array.

. ./load


# Note variables spread over multiple lines.

background=($Backgrounds)                # Read into array variable.
eye=($Eyes)

num_backgrounds=${#background[*]}        # Count how many elements.
num_eyes=${#eye[*]}

#echo -n "${eye[$((RANDOM%num_eyes))]} of "
#echo ${background[$((RANDOM%num_backgrounds))]}

echo "Background: ${background[$((RANDOM%num_backgrounds))]}"
echo "Eye: ${eye[$((RANDOM%num_eyes))]}"

exit 0

#- from: https://tldp.org/LDP/abs/html/randomvar.html
