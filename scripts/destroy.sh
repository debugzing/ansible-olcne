#!/bin/bash
#
# Title:      Script to handle the controlled destruction of the project components.
# Author(s):  Guzmán Monné
# URL:        https://github.com/conatel-i-d/scripts
# GNU:        General Public License v3.0
###############################################################################
EXTRA_VARS=$1

primestart() {
  menuprime
}

menuprime(){
  clear
  # Menu interface
  tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🛑 Spot Kubernetes Cluster on AWS: What do you want to destroy?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🌵 Select one of the following options:

[1] Destroy the servers
[2] Destroy the project VPC

[X] Destroy All
[M] Menu

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
  # Standby
  read -p '▶️  Type Number | Press [ENTER]: ' typed < /dev/tty

  case $typed in
    1 )
      ansible-playbook playbooks/destroy.yml --tags servers --extra-vars "$EXTRA_VARS"
      bash ./scripts/continue.sh
      menuprime ;;
    2 )
      ansible-playbook playbooks/destroy.yml --tags vpc --extra-vars "$EXTRA_VARS"
      bash ./scripts/continue.sh
      menuprime ;;
    X )
      ansible-playbook playbooks/destroy.yml --extra-vars "$EXTRA_VARS"
      bash ./scripts/continue.sh ;;
    M )
      exit ;;
    * )
      menuprime ;;
  esac
}
# Run the script
primestart