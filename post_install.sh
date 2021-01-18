#!/bin/sh

# set the data location
DATA_LOCATION="/app-data/sonarr"

# create the data location
mkdir -p $DATA_LOCATION

# make "sonarr" the owner of the data location
chown -R sonarr:sonarr $DATA_LOCATION

# make "sonarr" the owner it's directory
chown -R sonarr:sonarr /usr/local/share/sonarr

# we need write permission to be able to write plugins update.
chmod 755 /usr/local/sonarr

# enable sonarr to start at boot
sysrc "sonarr_enable=YES"

# set the sonarr data directory
sysrc "sonarr_data_dir=/app-data/sonarr"

# start the service
service sonarr start
