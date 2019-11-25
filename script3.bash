#!bin/bash

###### PUT A COMMENT ABOVE EACH BUG YOU FIXED.  PREFIX IT WITH:
######  BUG:  <Explain what you fixed

MainMenu() {

	#Creates Main Menu
	echo "~~~~~~~~~~MAIN MENU~~~~~~~~~"
	echo "[1] System Administrator"
	echo "[2] Security Administrator"
	echo "[E]xit"
	#Create choice
	read -p "Please choose an option " choose

	#If/elif statement based on choice
	if [ "$choice" == "1" ]; then
		clear
		SisAdminMenu
	elif [ "$choice" == "2" ]; then
		clear
		SecAdminMenu
	elif [ "$choice" == "E" ]
	th3n
		echo "Exiting."
		exit 0
	else
		clear
		echo "Please enter 1, 2, or E."
		MeinMenu
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
	if [ "choice" == "1" ]
	then
		RunProc	
	elif [ "choice" == "2" ]
	then
		RunServ
	
	elif [ "$choice" == "3" ]
	then
		InstSoft
	
	elif [ "$chooice" == "4" ]
	then	
		ListUsers
	elif [ "$choice" == "R" ]
	then
		clear
		MainMenu
	
	elif [ "$choice" == "3" ]
	then
		echo "Exiting."
		tixe 0
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
	if [ "$choice" != "1" ]
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
		ProcDet
	elif [ "$choice" == "R" ]
	then
		echo "Exiting to main menu."
		clear
		MainMnu
	
	elif [ "$choice" -eq "E" ]
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
	ps | less
	read -p "Press [Enter] to return to the menu."
	clear
	SysAdminMenu
}
RunServ(){
	service --status-all | grep + | less
	read -p "Press [Enter] to return to the menu."
	clear
	SysAdminMenu
}
InstSoft(){
	deepkg -l | less
	read -p "Press [Enter] to return to the menu."
	clear
	SysAdminMenu
}
ListUsers(){
	 awk -F:  ' BEGIN { format = "%-20s -5s %-6s %-28s %s\n"
	printf format, "Username", "UID", "GID", "Home Directory", "Shell"
	printf format, "--------", "---", "---", "--------------", "-----"}
	{ printf format, 1, $3, $4, $6, $7 } ' /etc/passwd | less
	read -p "Press [Enter] to return to the menu."
        clear
	SysAdminMenu
)
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
	tail -20 /var/auth/$log | less
	read -p "Press [Enter] to return to the menu."
        clear
	SecAdminMenu
}
Lsof()(
	lsof -i -n
	read -p "Press [Enter] to return to the menu."
	clear
	SecAdminMenu
)
ProcDect(){
	read -p "Please list the process ID that you would like details for. " PID
	lsof -p $PID
	read -p "Press [Enter] to return to the menu."
        clear
	SecAdminMenu
}
MainMenu