#!/bin/bash

# Copy uploaded files from praktijk to the right folder in /backups/*
# .doc* --> /backups/files/Word
# .xls* --> /backup/files/Excel
# De rest --> /backup/files/Other

sleep 5m

while true 
do
	# Run over all the files in /home/praktijk/incoming
	if (( `ls /home/praktijk/incoming | wc -l` > 0 ))
        then
                # Delete backup
                DIRNAME=`ls -rt /home/praktijk/incoming/ | head -1`
		                
		EXT=`echo $DIRNAME | awk -F '.' '{print $NF}'`

		# .doc* --> Word
		if [[ $EXT =~ doc* ]]
		then
			
			mv /home/praktijk/incoming/$DIRNAME /home/backup_download/files/Word/			
		elif [ $EXT == xls ]
		then
			# .xls* --> Excel
			mv /home/praktijk/incoming/$DIRNAME /home/backup_download/files/Excel
		else
			# Other --> other
			mv /home/praktijk/incoming/$DIRNAME /home/backup_download/files/Other/		
		fi

	else
        	# All the files are deleted

		# correct rights to the new files
		chown -R backup_download:backup_download /home/backup_download/files/*

	        exit 0;
        fi

done

