# `run_vpc`

Crea o destruye un VPC en la nube de AWS a través de CloudFormation.

## Variables de entorno

| Nombre | Descripción |
| --- | --- |
| `AWS_ACCESS_KEY_ID` | Llave de acceso de AWS. |
| `AWS_SECRET_ACCESS_KEY` | Llave secreta de acceso de AWS. |

## Variables del Playbook

| Nombre | Valor | Descripción |
| --- | --- | --- |
| `aws_region` | `us-east-1` | Región de AWS sobre la cual implementar el template. | 
| `cidr_block` | `10.240.0.0/16` | Intervalo de IPs a utilizar. |
| `output_file_path` | `./outputs/vpc_stack.json` | Directorio de salida de la ejecución de CF. |
| `project_name` | `run_vpc` | Nombre del proyecto. |
| `stack_name` | `run_vpc` | Nombre del stack de CloudFormation. |
| `state` | `present` | Estado de la solución. |