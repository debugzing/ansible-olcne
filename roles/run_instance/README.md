# `run_instance`

Crea o destruye una Instancia en la nube de AWS a traves de CloudFormation.

## Variables de entorno

| Nombre | Descripción |
| --- | --- |
| `AWS_ACCESS_KEY_ID` | Llave de acceso de AWS. |
| `AWS_SECRET_ACCESS_KEY` | Llave secreta de acceso de AWS. |

## Variables del Playbook

| Nombre | Valor | Descripción |
| --- | --- | --- |
| `image_id` | `ami-085925f297f89fce1` | AWS AMI a utilizar. |
| `instance_name` | `'{{ stack_name }}-instance'` | Nombre de la instancia. |
| `instance_type` | `m5.large` | Tipo de la intancia. |
| `key_name` |  | Nombre de la llave SSH de la instancia. |
| `name` | `{{ project_name }}-instance` | Nombre de la instancia. |
| `output_file_path` | `./outputs/vpc_stack.json` | Directorio de salida de la ejecución de CF. |
| `project_name` | `run_vpc` | Nombre del proyecto. |
| `security_group_id` |  | Security Group ID de la instancia. |
| `stack_name` | `run_vpc` | Nombre del stack de CloudFormation. |
| `state` | `present` | Estado de la solución. |
| `subnet_id` |  | Subnet ID de la instancia. |