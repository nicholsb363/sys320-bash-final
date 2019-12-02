#!/bin/bash

# StoryLine:

###### PUT A COMMENT ABOVE EACH BUG YOU FIXED.  PREFIX IT WITH:
######  BUG:  <Explain what you fixed

# 101.236.44.127 - - [24/Oct/2017:04:11:14 -0500] "GET / HTTP/1.1" 200 225 "-" "Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.94 Safari/537.36"

#BUG: Fixed third sed statement to remove double quotes
sed -e 's/\[//g' -e 's/\]//g' -e 's/\"//g' access.log |\
#BUG: Changed double quote to match closing single quote
awk ' BEGIN {
		print "IP," "Date," "Method," "URI," "User Agent"
	}
		{
		msg=""

		#BUG: Changed : to ;
		for (i = 12 ; i <= NF ; i++)
			msg = msg " " $i;

		#BUG: changed / to \
		q = "\""

		#BUG: Changed / to \
		cq = "\","

		# Print the output
		#BUG: Changed "ecq" to "cq"
		print q$1cq q$4cq q$6cq q$7cq (q msg cq)
		} '  | sed 's/," /,"/g' >> access.csv
