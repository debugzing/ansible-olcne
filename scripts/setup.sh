#!/bin/bash
#
# Title:      Script to launch a playbook to setup the project
# Author(s):  Guzmán Monné
# URL:        https://github.com/conatel-i-d/scripts
# GNU:        General Public License v3.0
###############################################################################
current_folder=`pwd`
vars_file_path=$current_folder/vars.yml
hosts_file_path=$current_folder/hosts.yml

ansible-playbook playbooks/setup.yml --extra-vars \
  "key_name=$KEY_NAME \
  project_name=olcne \
  ssh_user=$SSH_USER \
  hosted_zone_id=$HOSTED_ZONE_ID \
  domain=$DOMAIN \
  private_key_file_path=$PRIVATE_KEY_FILE_PATH \
  public_key_file_path=$PRIVATE_KEY_FILE_PATH.pub \
  vars_file_path=$vars_file_path \
  hosts_file_path=$hosts_file_path"