#!/bin/bash
# Storyline:

# Prompt the user to enter an IP of /24 only.
#BUG - user input did not require the user to enter a valid network address. Added a function to make the user \
#re-enter the IP until it is valid
function collect_ip() {
	read -p "Enter /24 network address.(I.E. 192.168.2.0): " net_Add
	if [[ $(echo $net_Add | awk -F. ' { print $4 } ') -ne 0 ]]
	then
		echo "This is not a /24 network address"
		collect_ip
	else
		:
	fi
}
collect_ip

# Splitting the IP to get the first three octets
net_Add2=$(echo $net_Add | awk -F. '{print $1"."$2"."$3"." }')

# Testing to be sure the parsing of the IP worked.
echo $net_Add2

#BUG $last_octet is unnecesary (removed)
#last_octet=${seq 0 255}

#loop through subnet (.0-.255) and check for hostname while skipping net and broadcast addr
#BUG - octet was misspelled
for octet in $(seq 0 255)
do
	IP="$net_Add2$octet"
	cmd=$(host ${IP})
	#skip over network and broadcast address
	if [[ ${octet} -eq 0 || ${octet} -eq 255 ]]
	then

		echo "${IP} is not a valid IP to scan."
		continue

	#check for hostname for valid IP's, if cmd output indicates a valid hostname, print it out
	elif [[ "${cmd}" =~ "domain name pointer" ]]
	then

		aRecord=$(host ${IP} | awk ' { print $5 }')
		echo "${IP} has the hostname: ${aRecord}."

	#if cmd does not indicate a valid hostname, notify the user
	else

		echo "The IP: ${IP} does not have a hostname."

	fi

#close the for loop
done
