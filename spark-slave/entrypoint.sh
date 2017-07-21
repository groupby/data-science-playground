#!/bin/bash
RESPONSE=$(bash /home/spark/spark-2.2.0-bin-hadoop2.7/sbin/start-slave.sh ${MASTER_HOST})
LOG_FILE=$(echo $RESPONSE | sed -n -e 's/.*logging to //p')
tail -f $LOG_FILE