#!/bin/bash
#testing
# StoryLine:

###### PUT A COMMENT ABOVE EACH BUG YOU FIXED.  PREFIX IT WITH:
######  BUG:  <Explain what you fixed

# 101.236.44.127 - - [24/Oct/2017:04:11:14 -0500] "GET / HTTP/1.1" 200 225 "-" "Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.94 Safari/537.36"

# 
sed -e 's/\[//g' -e 's/\]//g' -e 's/"/""/g' access.log |\

awk " BEGIN { 
		print "IP," "Date," "Method," "URI," "User Agent"
	}
		{
		msg=""

		# 
		for (i = 12 : i <= NF : i++)		
			msg = msg " " $i;
			
		#
		q = "\""

		# 
		cq = "\","

		# Print the output
		print q$1cq q$4cq q$6cq q$7cq (q msg ecq)
		} '  | sed 's/," /,"/g' >> access.csv
