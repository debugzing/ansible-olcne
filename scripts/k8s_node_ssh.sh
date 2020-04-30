#!/bin/bash
#
# Title:      SSH into one of the k8s nodes
#             from the vars file.
# Author(s):  Guzmán Monné
# URL:        https://github.com/conatel-i-d/scripts
# GNU:        General Public License v3.0
###############################################################################
tee <<-EOF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
read -p '▶️  Type the name of the k8s node you want to connect to: ' typed < /dev/tty

domain=$(cat vars.yml | grep domain | cut -d ':' -f2 | sed 's/^ *//g')
user=$(cat hosts.yml | grep ansible_ssh_user | cut -d ':' -f2 | sed 's/^ *//g')
host="$typed.$domain"

ssh -o ProxyCommand="ssh -A ec2-user@operator.$domain -W %h:%p" -o StrictHostKeyChecking=no $user@$host
