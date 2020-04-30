#!/bin/bash
#
# Title:      Script to launch a playbook to create the spot instance.
# Author(s):  Guzmán Monné
# URL:        https://github.com/conatel-i-d/scripts
# GNU:        General Public License v3.0
###############################################################################

ansible-playbook playbooks/spots.yml --extra-vars \
  "spot_account_id=$SPOT_ACCOUNT_ID \ 
  spot_api_token=$SPOT_API_TOKEN \
  private_key_file_path=$PRIVATE_KEY_FILE_PATH \
  subnet_id_a=$(cat ./outputs/vpc_stack.json | jq -r '.stack_outputs.PublicSubnetA') \
  subnet_id_b=$(cat ./outputs/vpc_stack.json | jq -r '.stack_outputs.PublicSubnetB') \
  subnet_id_c=$(cat ./outputs/vpc_stack.json | jq -r '.stack_outputs.PublicSubnetC') \
  vpc_id=$(cat ./outputs/vpc_stack.json | jq -r '.stack_outputs.VpcId') \
  security_group_id=$(cat ./outputs/vpc_stack.json | jq -r '.stack_outputs.SecurityGroupId')"