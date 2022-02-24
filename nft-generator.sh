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

nftno="1"

mkdir nfts/test

if [ ! -f nfts/test/1.txt ]; then
   background_result="${background[$((RANDOM%num_backgrounds))]}"
   eye_result="${eye[$((RANDOM%num_eyes))]}"
   echo "$background_result $eye_result" >> nfts/test/$nftno.txt
   echo "Background: $background_result"
   echo "Eye: $eye_result"
   find_duplicate="$background_result $eye_result"
   nftno="$(($nftno + 1))"
fi

generate () {
background_result="${background[$((RANDOM%num_backgrounds))]}"
eye_result="${eye[$((RANDOM%num_eyes))]}"
find_duplicate="$background_result $eye_result"
}

proceed () {
echo "$background_result $eye_result" >> nfts/test/$nftno.txt
echo "Background: $background_result"
echo "Eye: $eye_result"
nftno="$(($nftno + 1))"
}

duplicate_check_loop () {
generate
for filename in nfts/test/*.txt; do
   if [ "$(cat $filename)" = "$find_duplicate" ]; then
      echo "Duplicate reached! Skipping..."
   else
      proceed
fi
done
}

#if [ -f nfts/test/1.txt ]; then
#   
#fi

#while true; do
#   
#done

if [ -f nfts/test/1.txt ]; then
   while true; do
      duplicate_check_loop
done
fi

#if [ -f nfts/test/1.txt ]; then
#   while true; do
#      for filename in nfts/test/*.txt; do
#         background_result="${background[$((RANDOM%num_backgrounds))]}"
#         eye_result="${eye[$((RANDOM%num_eyes))]}"
#         find_duplicate="$background_result $eye_result"
#         if [ "$(cat $filename)" = "$find_duplicate" ]; then
#            echo "Duplicate reached! Skipping..."
#         else
#            echo "$background_result $eye_result" >> nfts/test/$nftno.txt
#            echo "Background: $background_result"
#            echo "Eye: $eye_result"
#            nftno="$(($nftno + 1))"
#fi
#done
#done
#fi

exit 0

#- from: https://tldp.org/LDP/abs/html/randomvar.html
