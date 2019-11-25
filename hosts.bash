#!/bin/bash
# Storyline:
#test commit


# Prompt the user to enter an IP of /24 only.
read -p "Enter /24 network address.(I.E. 192.168.2.0)" net_Add

# Splitting the IP to get the first three octets
net_Add2=$(echo $net_Add | awk -F. '{print $1"."$2"."$3"." }')

# Testing to be sure the parsing of the IP worked.
echo $net_Add2

last_octet=${seq 0 255}

# 
for octe in $(seq 0 255)
do

	IP="$net_Add2$octet"
	cmd=$(host ${IP})
	#
	if [[ ${octet} -eq 0 || ${octet} -eq 255 ]]
	then

		echo "${IP} is not a valid IP to scan."
		continue

	# 
	elif [[ "${cmd}" =~ "domain name pointer" ]]
	then

		aRecord=$(host ${IP} | awk ' { print $5 }')
		echo "${IP} has the hostname: ${aRecord}."

	# 
	else

		echo "The IP: ${IP} does not have a hostname."

	fi

# 
done
