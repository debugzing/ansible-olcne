#!/bin/bash
#
# Title:      Spot AWS
# Author(s):  Guzmán Monné
# URL:        https://github.com/conatel-i-d/elastic-enterprise-search-demo
# GNU:        Genral Public Licencse v3.0
###############################################################################

export ANSIBLE_CONFIG=./ansible.cfg

primestart() {
  setupprime
  menuprime
}

setupprime(){
  if [ -f .env ]
  then
    export $(cat .env | sed 's/#.*//g' | xargs)
  fi

  eval "$(ssh-agent -s)"
  ssh-add $PRIVATE_KEY_FILE_PATH
}

menuprime(){
  clear
  # Menu interface
  tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🌎 Oracle Linux Cloud Native Environment: What do you want to do?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🌵 Select one of the following options:

EOF
  tee <<-EOF
[0] Setup the project
[1] Create the project VPC
[2] Create the Operator, Master, and Worker nodes
[3] SSH to Operator Server
[4] SSH to K8s Node

[A] Deploy
[X] Destroy
[Q] Exit

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
  # Standby
  read -p '▶️  Type Number | Press [ENTER]: ' typed < /dev/tty

  case $typed in
    0 )
      bash ./scripts/setup.sh
      bash ./scripts/continue.sh
      menuprime ;;
    1 )
      ansible-playbook playbooks/vpc.yml
      bash ./scripts/continue.sh
      menuprime ;;
    2 )
      bash ./scripts/servers.sh
      bash ./scripts/continue.sh
      menuprime ;;
    3 )
      bash ./scripts/operator_ssh.sh
      bash ./scripts/continue.sh
      menuprime ;;
    4 )
      bash ./scripts/k8s_node_ssh.sh
      bash ./scripts/continue.sh
      menuprime ;;
    A )
      ansible-playbook playbooks/vpc.yml
      bash ./scripts/servers.sh
      bash ./scripts/continue.sh
      menuprime ;;
    X )
      bash ./scripts/destroy.sh "spot_account_id=$SPOT_ACCOUNT_ID spot_api_token=$SPOT_API_TOKEN"
      menuprime ;;
    Q )
      bash ./scripts/ending.sh
      exit ;;
    * )
      menuprime ;;
  esac
}

# Run the script
primestart
