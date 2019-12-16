#!/bin/bash
# Log each BT connection/disconnection start/stop the service bluealsa-aplay

sudo touch /var/log/a2dp-autoconnect
sudo chmod a+rw /var/log/a2dp-autoconnect

function log {
        sudo echo "[$(date)]: $*" >> /var/log/a2dp-autoconnect
}

BTMAC=${NAME//\"/}

if [ $(echo ${BTMAC} | egrep "^([0-9A-F]{2}:){5}[0-9A-F]{2}$") ]; then
        if [ ${ACTION} = "remove" ]; then
                log "Stop Played Connection " ${BTMAC}
                sudo systemctl stop bluealsa-aplay@${BTMAC}
        elif [ ${ACTION} = "add" ]; then
                log "Start Played Connection " ${BTMAC}
                sudo systemctl start bluealsa-aplay@${BTMAC}
        else
                log "Other action " ${ACTION}
        fi
fi
