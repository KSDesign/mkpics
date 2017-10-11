#!/bin/sh
if [ -d $1 ]
then
    PATH=$PATH:/courses/webspace/cscb09w16/bin
    cd $1
    for pic in *.jpg
    do
	year=2016
	yearmin=2000
	count=0
	while [ $year -gt $yearmin ]
	do 
	   for month in "$year:01" "$year:02" "$year:03" "$year:03" "$year:04" "$year:05" "$year:06" "$year:07" "$year:08" "$year:09" "$year:10" "$year:11" "$year:12"
	   do
	        if exiftime -tg $pic | grep -q "$month"
		then
		    if [ -d $year ]
		    then
		        mv $pic $year
		        cd $year
		        if [ -d $month ]
		        then
			    mv $pic $month
		        else
			    mkdir $month
			    mv $pic $month
		        fi
		        cd ..
		    else
		   	mkdir $year
		   	mv $pic $year
		    	cd $year
		    	mkdir $month
		    	mv $pic $month
		    	cd ..
		    fi
		fi
	    done
	    year=`expr $year - 1`
    	done
    done
    else
    echo "The command line parameter is not a directory." >&2
fi
