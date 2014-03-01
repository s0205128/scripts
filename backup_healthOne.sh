#/bin/bash

# log files in /tmp/watcher.log

RESULT=false

# daily:
#	/backups/healthOne/daily
#	max: 7
while ! $RESULT
do
        if (( `ls /backups/healthOne/daily/ | wc -l` > 7 ))
        then
		# delete oldest backup directory
		DIRNAME=`ls -rt /backups/healthOne/daily/ | head -1`
		rm -r /backups/healthOne/daily/$DIRNAME
	else
		# daily up-to-date
		echo "`date +"%Y-%m-%d %T"` daily up-to-date"
		RESULT=true
	fi

done

RESULT=false

# weekly:
#	/backups/healthOne/weekly
#	max: 4
while ! $RESULT
do
        if (( `ls /backups/healthOne/weekly/ | wc -l` > 4 ))
        then
                # delete oldest backup directory
                DIRNAME=`ls -rt /backups/healthOne/weekly/ | head -1`
                rm -r /backups/healthOne/weekly/$DIRNAME
        else
                # weekly up-to-date
                echo "`date +"%Y-%m-%d %T"` weekly up-to-date"
                RESULT=true;
        fi

done

RESULT=false

# monthly:
#	/backups/healthOne/monthly
# 	max: 6
while ! $RESULT
do
        if (( `ls /backups/healthOne/monthly/ | wc -l` > 6 ))
        then
                # delete oldest backup directory
                DIRNAME=`ls -rt /backups/healthOne/monthly/ | head -1`
                rm -r /backups/healthOne/monthly/$DIRNAME
        else
                # monthly up-to-date
                echo "`date +"%Y-%m-%d %T"` monthly up-to-date"
                RESULT=true;
        fi

done

RESULT=false

# yearly:
#	/backups/healthOne/yearly
#	max: 2
while ! $RESULT
do
        if (( `ls /backups/healthOne/yearly/ | wc -l` > 2 ))
        then
                # delete oldest backup directory
                DIRNAME=`ls -rt /backups/healthOne/yearly/ | head -1`
                rm -r /backups/healthOne/yearly/$DIRNAME
        else
                # yearly up-to-date
                echo "`date +"%Y-%m-%d %T"` yearly up-to-date"
                RESULT=true;
        fi

done
