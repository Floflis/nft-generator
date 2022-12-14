#!/bin/bash
# pick-card.sh
# This is an example of choosing random elements of an array.

# Get the possible combinations/characteristics from the "load" file
. ./load
# Note variables spread over multiple lines.

# Read into array variable.
background=($Backgrounds)
eye=($Eyes)
# Count how many elements.
num_backgrounds=${#background[*]}
num_eyes=${#eye[*]}


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

#save () {
#echo "$background_result $eye_result" >> nfts/test/$nftno.txt
#echo "Background: $background_result"
#echo "Eye: $eye_result"
#nftno="$(($nftno + 1))"
#}

save () {

}

duplicate_check_loop () {
generate
for filename in nfts/test/*.txt; do
   if [ "$(cat $filename)" = "$find_duplicate" ]; then
      echo "Duplicate reached! Skipping..."
   else
      save
fi
done
}

#if [ -f nfts/test/1.txt ]; then
#   
#fi

#while true; do
#   
#done

#if [ -f nfts/test/1.txt ]; then
#   while true; do
#      duplicate_check_loop
#done
#fi

#if [ -f nfts/test/1.txt ]; then
#   duplicate_check_loop
#   (bash nft-generator.sh &)
#fi

#if [ -f nfts/test/1.txt ]; then
#   while true; do
#      duplicate_check_loop
#      sleep 5s
#done
#fi

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
