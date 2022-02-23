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

find_duplicate="${background[$((RANDOM%num_backgrounds))]} ${eye[$((RANDOM%num_eyes))]}"

nftno="1"

if [ -f nfts/test/2.txt ]; then
   for filename in nfts/test/*.txt; do
      if [ "$(cat $filename)" = "$find_duplicate" ]; then
         echo "Duplicate reached! Skipping..."
      else
         echo "${background[$((RANDOM%num_backgrounds))]}" >> nfts/test/$nftno.txt
         echo "${eye[$((RANDOM%num_eyes))]}" >> nfts/test/$nftno.txt
         echo "Background: ${background[$((RANDOM%num_backgrounds))]}"
         echo "Eye: ${eye[$((RANDOM%num_eyes))]}"
         nftno="$(($nftno + 1))"
fi
done
else
   echo "${background[$((RANDOM%num_backgrounds))]}" >> nfts/test/1.txt
   echo "${eye[$((RANDOM%num_eyes))]}" >> nfts/test/1.txt
   echo "Background: ${background[$((RANDOM%num_backgrounds))]}"
   echo "Eye: ${eye[$((RANDOM%num_eyes))]}"
fi

exit 0

#- from: https://tldp.org/LDP/abs/html/randomvar.html
