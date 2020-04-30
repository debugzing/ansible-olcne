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