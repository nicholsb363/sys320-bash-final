# BUG: added "/" in the middle of ! and bin
#!/bin/bash

###### PUT A COMMENT ABOVE EACH BUG YOU FIXED.  PREFIX IT WITH:
######  BUG:  <Explain what you fixed

MainMenu() {

	#Creates Main Menu
	echo "~~~~~~~~~~MAIN MENU~~~~~~~~~"
	echo "[1] System Administrator"
	echo "[2] Security Administrator"
	echo "[E]xit"
	#Create choice
	#BUG: changed chooise to choice
	read -p "Please choose an option " choice

	#If/elif statement based on choice
	if [ "$choice" == "1" ]; then
		clear
		
		#BUG: changed sis to Sys
		SysAdminMenu
	elif [ "$choice" == "2" ]; then
		clear
		SecAdminMenu
	elif [ "$choice" == "E" ]
	
	#BUG: replaced 3 with e in then
	then
		echo "Exiting."
		exit 0
	else
		clear
		echo "Please enter 1, 2, or E."
		#BUG: changed MeinMenu to MainMenu
		MainMenu
	fi
}
SysAdminMenu() {
	#Creates Menu
	echo "~~~~~~~~~~SYSTEM ADMIN MENU~~~~~~~~~"
	echo "[1] List all running processes"
	echo "[2] List all running services"
	echo "[3] List all installed software"
	echo "[4] List all users"
	echo "[R]eturn to main menu"
	echo "[E]xit"
	#Create choice
	read -p "Please choose an option " choice
	#If/elif statement based on choice
	#BUG: Changed choice to $choice
	if [ "$choice" == "1" ]
	then
	#BUG: Changed RunProc
		RunProc
	#BUG: Changed choice to $choice
	elif [ "$choice" == "2" ]
	then
		RunServ
	
	elif [ "$choice" == "3" ]
	then
		InstSoft
	#BUG: Corrected $choice spelling
	elif [ "$choice" == "4" ]
	then	
		ListUsers
	elif [ "$choice" == "R" ]
	then
		clear
		MainMenu
		
	#BUG: changed 3 to E
	elif [ "$choice" == "E" ]
	then
		echo "Exiting."
		#BUG: changed tixe to exit
		exit 0
	else
		clear
		echo "Please enter one of the options in the brackets."
		SysAdminMenu
	fi
	
}
SecAdminMenu() {
	#Creates Menu
	echo "~~~~~~~~~~SECURITY ADMIN MENU~~~~~~~~~"
	echo "[1] List last 10 logged in users"
	echo "[2] Print last 20 lines of a log file"
	echo "[3] Run lsof -i -n"
	echo "[4] Print details of a process"
	echo "[R]eturn to main menu"
	echo "[E]xit"
	#Create choice
	read -p "Please choose an option " choice
	#If/elif statement based on choice
	#BUG: chnged != to ==
	if [ "$choice" == "1" ]
	then
		LastLogged	
	elif [ "$choice" == "2" ]
	then
		LastOfFile
	
	elif [ "$choice" == "3" ]
	then
		Lsof
	
	elif [ "$choice" == "4" ]
	then	
		#BUG: changed ProcDet to ProcDet
		ProcDect
		
	elif [ "$choice" == "R" ]
	then
		echo "Exiting to main menu."
		clear
		#BUG: changed MainMnu to MainMenu 
		MainMenu 
	#BUG: changed -eq to ==
	elif [ "$choice" == "E" ]
	then
		echo "Exiting"
		exit 0
	else
		clear
		echo "Please enter one of the options in the brackets."
		SecAdminMenu
	fi
}
RunProc(){
	#BUG: Removed less, added -ef, added clear
	clear
	ps -ef
	read -p "Press [Enter] to return to the menu."
	clear
	SysAdminMenu
}
RunServ(){
	#BUG: Removed less, added clear
	clear
	service --status-all | grep +
	read -p "Press [Enter] to return to the menu."
	clear
	SysAdminMenu
}
InstSoft(){
	#BUG: Removed less, corrected dpkg command
	dpkg -l
	read -p "Press [Enter] to return to the menu."
	clear
	SysAdminMenu
}
ListUsers(){
	clear
	 awk -F:  ' BEGIN { format = "%-20s -5s %-6s %-28s %s\n"
	printf format, "Username", "UID", "GID", "Home Directory", "Shell"
	printf format, "--------", "---", "---", "--------------", "-----"}
	#BUG: Changed 1 to $1
	{ printf format, $1, $3, $4, $6, $7 } ' /etc/passwd #| less
	read -p "Press [Enter] to return to the menu."
        clear
	SysAdminMenu
#BUG: Changed ) to } on line 146
}
LastLogged(){
	last >> /tmp/last.tmp
	head -10 /tmp/last.tmp
	read -p "Press [Enter] to return to the menu."
        clear
	SecAdminMenu
}
LastOfFile(){
	ls /var/log
	read -p "Please type in the log file that you would like to view.  " log
	#BUG: Changed path to /var/log
	clear
	tail -20 /var/log/$log #| less
	read -p "Press [Enter] to return to the menu."
        clear
	SecAdminMenu
}
Lsof()(
	clear
	lsof -i -n
	read -p "Press [Enter] to return to the menu."
	clear
	SecAdminMenu
)
ProcDect(){
	clear
	read -p "Please list the process ID that you would like details for. " PID
	lsof -p $PID
	read -p "Press [Enter] to return to the menu."
        clear
	SecAdminMenu
}
MainMenu
