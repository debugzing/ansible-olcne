#!/bin/bash
#
# Title:      SSH into the operator server by parsing the domain variable
#             from the vars file.
# Author(s):  Guzmán Monné
# URL:        https://github.com/conatel-i-d/scripts
# GNU:        General Public License v3.0
###############################################################################

host="operator.$(cat vars.yml | grep domain | cut -d ':' -f2 | sed 's/^ *//g')"
user=$(cat hosts.yml | grep ansible_ssh_user | cut -d ':' -f2 | sed 's/^ *//g')

ssh -i $PRIVATE_KEY_FILE_PATH $user@$host
