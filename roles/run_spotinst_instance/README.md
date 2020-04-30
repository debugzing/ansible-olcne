# `run_spotinst_instance`

Crea una instancia de `spotinst` en la nube de AWS.

## Variables del Playbook

| Nombre | Valor | Descripción |
| --- | --- | --- |
| `managed_instance_configuration` | `` | Configuración completa de una Spotinst Managed IP. |
| `managed_instance_id` | `` | El ID de la instancia a eliminar. No se necesita si al momento de crear la instancia. |
| `spot_account_id` | `` | Spotinst account ID. | 
| `spot_api_token` | `` | Spotinst API Token. |
| `state` | `present` | Estado de la instancia. **Cuando el valor es `absent` se eliminan todos los recursos asociados a esa instancia.**|