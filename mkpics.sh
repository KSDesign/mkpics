#!/bin/sh
#If statement to check if there are command-line parameters
if [ $# -ne 0 ]
then
    #HTML Code
    echo "<!DOCTYPE HTML PUBLIC "-//W3X//DTD HTML 4.01 Transitionl//EN">"
    echo "<html>"
    echo "	<head>"
    echo "		<title>Pictures</title>"
    echo "	</head>"
    echo ""
    echo "<body>"
    echo "	<h1>Pictures</h1>"
    echo "<table>"
    cmdLineParamCountLessOne=`expr $# - 1`
    counter=0
    if [ $cmdLineParamCountLessOne -ne 0 ]
    then
        echo "<tr>"
    fi
    #For loop to perform actions for each command line parameter
    for i in "$@"
    do
        #Does nothing for the first parameters
        if [ "$i" = "$1" ]
        then
            :
        #Checks if the other command line parameters are jpegs
        #Then outputs the pics accordingly
        elif file --mime-type -b $i | grep -q jpeg
        then
            echo "<td><img src="$i" height=100></td>"
	    counter=`expr $counter + 1`
	    if [ `expr $counter % $1` -eq 0 ]
	    then
	        echo "</tr>"
	        if [ $counter -lt $cmdLineParamCountLessOne ] 
	        then
		    echo "<tr>"
	        fi
	    fi
        else
	echo "$i is not a JPEG file." >&2
        fi
    done
    if [ `expr $cmdLineParamCountLessOne % $1` -ne 0 ]
    then
        echo "</tr>"
    fi
    echo "</table>"
    echo "</body>"
    echo "</html>"
else
    echo "There are no command-line parameters. Program will not run." >&2
fi
