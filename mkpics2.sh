#!/bin/sh
#Checks to see if the second parameter is a directory
if [ -d $2 ]
then
    #HTML Code 
    echo "<!DOCTYPE HTML PUBLICS "-//W3C//DTD HTML 4.01 Transitional//EN">"
    echo "<html>"
    echo "    <head>"
    echo "        <title>Pictures</title>"
    echo "    </head>"
    echo ""
    echo "    <body>"
    echo "        <h1>Pictures</h1>"
    echo ""
    #Enters Directory
    cd $2
    #For loop to perform actions for each year
    #1920 was the year the first digital photograph was taken
    year=2016
    yearmin=1920
    while [ $year -gt $yearmin ]
    do
	#Checks to see if this year has a directory
	if [ -d $year ]
        then
	    counter=0
	    echo "<h2>$year</h2>"
	    echo "<table>"
	    #Enters the directory of the year
	    cd $year
	    #For loop to perform actions for each year
	    for month in 01 02 03 04 05 06 07 08 09 10 11 12
	    do
		#Checks to see if this month has a directory
		if [ -d $month ]
		then
		    #Enters directory for the month
		    cd $month
		    if [ `expr $counter % $1` -eq 0 ]
		    then
			echo "<tr>"
		    fi
		    #For loop to output only the pictures in the directory
		    for pic in $2/$year/$month/*.jpg
		    do
		        echo "<td><img src="$pic" height=100></td>"
        		counter=`expr $counter + 1`
        		if [ `expr $counter % $1` -eq 0 ]
        		then
                            echo "</tr>"
        		fi
		    done
		    #Moves out of directory
		    cd ..
		fi
	    done
	    if [ `expr $counter % $1` -ne 0 ]
	    then
	    	echo "</tr>"
	    fi
	    echo "</table>"
	    echo ""
	    #Moves out of directory
	    cd ..
	fi
    year=`expr $year - 1`
    done
else
    #Output if the 2nd param is not a directory
    echo "The second parameter is not a directory." >&2
fi
echo "</body>"
echo "</html>"
