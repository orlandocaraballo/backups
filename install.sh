#!/bin/sh

# TODO: add --dry-run option
# TODO: check if rsync is installed

read -p 'Remote username: ' REMOTE_USERNAME
read -p 'Remote ip: ' REMOTE_IP

# TODO: fix the following code to only accept the following two values
read -p 'How often would you like to backup: (hourly, daily)' CADENCE

# local username, local hostname, remote username, remote ip
echo $USER, $HOSTNAME, $REMOTE_USERNAME, $REMOTE_IP, $CADENCE

# create a new file based on the example version
cp backup.example backup

# run several search and replacements for our variables
sed -i -e "s/\[local-username\]/$USER/g" ./backup
sed -i -e "s/\[local-hostname\]/$HOSTNAME/g" ./backup
sed -i -e "s/\[remote-username\]/$REMOTE_USERNAME/g" ./backup
sed -i -e "s/\[remote-ip\]/$REMOTE_IP/g" ./backup

# set backup script to be executable
chmod +x backup

# TODO: check if /etc/cron.hourly or /etc/cron.daily exist if not create
# TODO: move backup script to /etc/cron.hourly or /etc/cron.daily