# Setup

Realiza las configuraciones básicas del proyecto.

## Variables

| Nombre | Valor | Descripción |
| --- | --- | --- |
| `key_name` | `id_rsa` | Nombre de la llave pública con la cual acceder a las instancias de EC2 por SSH. |
| `project_name` | `spot` | Nombre del proyecto |
| `public_key_file_path` | `~/.ssh/id_rsa.pub` | Ruta hacia la llave pública con la cual crear la llave privada en AWS. |
| `vars_file_path` | `./vars.yml` | Ubicación del archivo de variables. |