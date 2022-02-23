#!/bin/bash
# pick-card.sh

# This is an example of choosing random elements of an array.

. ./load


# Note variables spread over multiple lines.

suite=($Suites)                # Read into array variable.
denomination=($Denominations)

num_suites=${#suite[*]}        # Count how many elements.
num_denominations=${#denomination[*]}

echo -n "${denomination[$((RANDOM%num_denominations))]} of "
echo ${suite[$((RANDOM%num_suites))]}

exit 0

#- from: https://tldp.org/LDP/abs/html/randomvar.html
