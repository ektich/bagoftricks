#!/bin/bash
#
# October 2018
#
# Example on how to split a string and store its parts in variables
#
# This example uses a side-effect of =~ binary operator of the
# conditional expression evaluation.
#
# following code "splits" line in /etc/passwd format into fields

line="guest:!:100:100:Guest:/home/guest:/bin/bash"

# match the line using regular exception, no need to check the return
[[ $line =~ ([^:]+):([^:]+):([^:]+):([^:]+):([^:]+):([^:]+):([^:]+) ]] 

# ${BASH_REMATCH[0]} is the matched string
# rest of elements are parts of the line
echo "User name:" ${BASH_REMATCH[1]}
echo "UID:" ${BASH_REMATCH[3]}
echo "Full Name (gecos):" ${BASH_REMATCH[5]}
