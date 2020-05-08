# Spot Kubernetes Cluster on AWS

Conjunto de Ansible Playbooks que permiten la creación de un clúster de Kubernetes sobre AWS, gestionado por [Spot](https://console.spotinst.com/) Utilizando [Oracle Linux Cloud Native Environment](https://docs.oracle.com/en/operating-systems/olcne/).

## Variables de Entorno

Estas variables deben ser configuradas en el archivo `.env` o deben estar cargadas en la sesión donde se ejeucta el script.

| Nombre | Descripción |
| --- | --- |
| `AWS_ACCESS_KEY_ID`| Llave de acceso de AWS. |
| `AWS_SECRET_ACCESS_KEY`| Llave secreta de acceso de AWS. |
| `KEY_NAME` | Nombre de llave SSH a crear en AWS. |
| `PRIVATE_KEY_FILE_PATH`| Ruta de acceso hacia el archivo de llave privada para poder acceder a las instancias creadas en AWS. |
| `SPOT_ACCOUNT_ID`| Identidad de la cuenta de `spotinst`. |
| `SPOT_API_TOKEN`| Token de acceso permanente a la API de `spotinst`. |

Carga la ubicación del archivo kubeconfig que adjunto en este correo en la variable de entorno KUBECONFIG

```bash
export KUBECONFIG=<path_to_kubeconfig>
```

A partir de ahí ya podes acceder al clúster
```bash
kubectl get nodes
NAME                           STATUS   ROLES    AGE     VERSION
ip-10-240-0-100.ec2.internal   Ready    <none>   2d22h   v1.17.4+1.0.1.el7
ip-10-240-0-200.ec2.internal   Ready    master   2d22h   v1.17.4+1.0.1.el7
ip-10-240-1-100.ec2.internal   Ready    <none>   2d22h   v1.17.4+1.0.1.el7
ip-10-240-1-200.ec2.internal   Ready    master   2d22h   v1.17.4+1.0.1.el7
ip-10-240-2-100.ec2.internal   Ready    <none>   2d22h   v1.17.4+1.0.1.el7
ip-10-240-2-200.ec2.internal   Ready    master   2d22h   v1.17.4+1.0.1.el7
```

El clúster ya esta configurado para trabajar con `istio`.

```bash
kubectl get pods -n istio-system
NAME                                     READY   STATUS      RESTARTS   AGE
grafana-55f5cd7b79-dc9r8                 1/1     Running     0          2d20h
istio-citadel-6c5669c467-5rjxx           1/1     Running     0          2d20h
istio-citadel-6c5669c467-s2sxt           1/1     Running     0          2d20h
istio-egressgateway-6dcfc8d565-2rcgz     1/1     Running     0          2d20h
istio-egressgateway-6dcfc8d565-kthbz     1/1     Running     0          2d20h
istio-galley-7dd59df966-pngxj            1/1     Running     0          2d20h
istio-galley-7dd59df966-zwpzb            1/1     Running     0          2d20h
istio-ingressgateway-5fb6ff7596-rc67d    1/1     Running     0          2d20h
istio-ingressgateway-5fb6ff7596-wwrqb    1/1     Running     0          2d20h
istio-init-crd-10-1.4.6-b75js            0/1     Completed   0          2d20h
istio-init-crd-11-1.4.6-vt5c5            0/1     Completed   0          2d20h
istio-init-crd-14-1.4.6-664s2            0/1     Completed   0          2d20h
istio-pilot-f94cc699b-kclv6              2/2     Running     0          2d20h
istio-pilot-f94cc699b-rftw6              2/2     Running     0          2d20h
istio-policy-545ff59557-2cn6v            2/2     Running     1          2d20h
istio-policy-545ff59557-dfx8m            2/2     Running     0          2d20h
istio-sidecar-injector-fd86b9674-699cq   1/1     Running     0          2d20h
istio-sidecar-injector-fd86b9674-lscrj   1/1     Running     0          2d20h
istio-telemetry-6fb54497c4-dpc7d         0/2     Pending     0          2d20h
istio-telemetry-6fb54497c4-x8hgd         2/2     Running     0          2d20h
prometheus-69685f55b6-5694z              1/1     Running     0          2d20h
```

Istio es un software de Service Mesh, que basicamente se encarga de todas las tareas de conectividad entre los contenedores y el resto del mundo.

Te recomiendo que leas más del tema en este link:

[Istio getting started](https://istio.io/docs/setup/getting-started/#dashboard)


