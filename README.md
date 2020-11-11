# Spot Kubernetes Cluster on AWS

Set of Ansible Playbooks that allow the creation of a Kubernetes cluster on AWS, managed by [Spot] (https://console.spotinst.com/) Using [Oracle Linux Cloud Native Environment] (https://docs.oracle. com / en / operating-systems / olcne /).

## Environment Variables

These variables must be configured in the `.env` file or they must be loaded in the session where the script is executed.

| Name | Description |
| --- | --- |
| ʻAWS_ACCESS_KEY_ID` | AWS Access Key. |
| ʻAWS_SECRET_ACCESS_KEY` | AWS access secret key. |
| `KEY_NAME` | SSH key name to create in AWS. |
| `PRIVATE_KEY_FILE_PATH` | Path to the private key file to access the instances created in AWS. |
| `SPOT_ACCOUNT_ID` | Identity of the `spotinst` account. |
| `SPOT_API_TOKEN` | Permanent access token to the `spotinst` API. |

Load the location of the kubeconfig file that I attach in this email in the KUBECONFIG environment variable

bash
export KUBECONFIG = <path_to_kubeconfig>
`` ''

From there you can access the cluster
bash
kubectl get nodes
NAME STATUS ROLES AGE VERSION
ip-10-240-0-100.ec2.internal Ready <none> 2d22h v1.17.4 + 1.0.1.el7
ip-10-240-0-200.ec2.internal Ready master 2d22h v1.17.4 + 1.0.1.el7
ip-10-240-1-100.ec2.internal Ready <none> 2d22h v1.17.4 + 1.0.1.el7
ip-10-240-1-200.ec2.internal Ready master 2d22h v1.17.4 + 1.0.1.el7
ip-10-240-2-100.ec2.internal Ready <none> 2d22h v1.17.4 + 1.0.1.el7
ip-10-240-2-200.ec2.internal Ready master 2d22h v1.17.4 + 1.0.1.el7
`` ''

The cluster is already configured to work with ʻistio`.

bash
kubectl get pods -n istio-system
NAME READY STATUS RESTARTS AGE
grafana-55f5cd7b79-dc9r8 1/1 Running 0 2d20h
istio-citadel-6c5669c467-5rjxx 1/1 Running 0 2d20h
istio-citadel-6c5669c467-s2sxt 1/1 Running 0 2d20h
istio-egressgateway-6dcfc8d565-2rcgz 1/1 Running 0 2d20h
istio-egressgateway-6dcfc8d565-kthbz 1/1 Running 0 2d20h
istio-galley-7dd59df966-pngxj 1/1 Running 0 2d20h
istio-galley-7dd59df966-zwpzb 1/1 Running 0 2d20h
istio-ingressgateway-5fb6ff7596-rc67d 1/1 Running 0 2d20h
istio-ingressgateway-5fb6ff7596-wwrqb 1/1 Running 0 2d20h
istio-init-crd-10-1.4.6-b75js 0/1 Completed 0 2d20h
istio-init-crd-11-1.4.6-vt5c5 0/1 Completed 0 2d20h
istio-init-crd-14-1.4.6-664s2 0/1 Completed 0 2d20h
istio-pilot-f94cc699b-kclv6 2/2 Running 0 2d20h
istio-pilot-f94cc699b-rftw6 2/2 Running 0 2d20h
istio-policy-545ff59557-2cn6v 2/2 Running 1 2d20h
istio-policy-545ff59557-dfx8m 2/2 Running 0 2d20h
istio-sidecar-injector-fd86b9674-699cq 1/1 Running 0 2d20h
istio-sidecar-injector-fd86b9674-lscrj 1/1 Running 0 2d20h
istio-telemetry-6fb54497c4-dpc7d 0/2 Pending 0 2d20h
istio-telemetry-6fb54497c4-x8hgd 2/2 Running 0 2d20h
prometheus-69685f55b6-5694z 1/1 Running 0 2d20h
`` ''

Istio is a Service Mesh software, which basically takes care of all the connectivity tasks between the containers and the rest of the world.

I recommend that you read more about the topic in this link:

[Istio getting started] (https://istio.io/docs/setup/getting-started/#dashboard)

