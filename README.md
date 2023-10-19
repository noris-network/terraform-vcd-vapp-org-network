# terraform-vcd-vapp-org-network

Terraform module which manages connections of Org Networks to vApps on VMWare Cloud Director.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.9 |
| <a name="requirement_vcd"></a> [vcd](#requirement\_vcd) | >= 3.9.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vcd"></a> [vcd](#provider\_vcd) | 3.9.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vcd_vapp_org_network.vapp_org_network](https://registry.terraform.io/providers/vmware/vcd/latest/docs/resources/vapp_org_network) | resource |
| [vcd_network_routed_v2.network_routed_v2](https://registry.terraform.io/providers/vmware/vcd/latest/docs/data-sources/network_routed_v2) | data source |
| [vcd_nsxt_edgegateway.nsxt_edgegateway](https://registry.terraform.io/providers/vmware/vcd/latest/docs/data-sources/nsxt_edgegateway) | data source |
| [vcd_vapp.vapp](https://registry.terraform.io/providers/vmware/vcd/latest/docs/data-sources/vapp) | data source |
| [vcd_vdc_group.vdc_group](https://registry.terraform.io/providers/vmware/vcd/latest/docs/data-sources/vdc_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vapp_name"></a> [vapp\_name](#input\_vapp\_name) | The vApp this Org network belongs to. | `string` | n/a | yes |
| <a name="input_vdc_edgegateway_name"></a> [vdc\_edgegateway\_name](#input\_vdc\_edgegateway\_name) | Name of the Edge Gateway the Org Network is connected to. | `string` | n/a | yes |
| <a name="input_vdc_group_name"></a> [vdc\_group\_name](#input\_vdc\_group\_name) | Data Center Group that the Edge Gateway belongs to. | `string` | n/a | yes |
| <a name="input_vdc_org_name"></a> [vdc\_org\_name](#input\_vdc\_org\_name) | The name of the organization to use. | `string` | n/a | yes |
| <a name="input_is_fenced"></a> [is\_fenced](#input\_is\_fenced) | Fencing allows identical virtual machines in different vApp networks connect to organization VDC networks that are accessed in this vApp. | `bool` | `false` | no |
| <a name="input_org_network_name"></a> [org\_network\_name](#input\_org\_network\_name) | An Org network name to which vApp network is connected. If not configured, then an isolated network is created. | `string` | `null` | no |
| <a name="input_reboot_vapp_on_removal"></a> [reboot\_vapp\_on\_removal](#input\_reboot\_vapp\_on\_removal) | (VCD 10.4.1+) API prohibits removal of vApp network from a powered on vApp. Set to true to power off the vApp during vApp network removal. If the vApp's original state was powered on, it will be powered back on after removing the network. (default false) Note. It only affects delete operation for the resource and will never power cycle vApp during update operations. Changing this value will cause plan change, but update will be a no-op operation. | `bool` | `false` | no |
| <a name="input_retain_ip_mac_enabled"></a> [retain\_ip\_mac\_enabled](#input\_retain\_ip\_mac\_enabled) | Specifies whether the network resources such as IP/MAC of router will be retained across deployments. Configurable when is\_fenced is true. | `bool` | `false` | no |
| <a name="input_vdc_name"></a> [vdc\_name](#input\_vdc\_name) | The name of VDC to use. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the vApp Org Network. |
<!-- END_TF_DOCS -->

## Examples

```
module "vcd_vapp_org_network" {
  source               = "git::https://github.com/noris-network/terraform-vcd-vapp-org-network?ref=1.0.0"
  vdc_org_name         = "myORG"
  vdc_group_name       = "myDCGroup"
  vdc_edgegateway_name = "T1-myORG"
  vdc_name             = "myDC01"
  vapp_name            = "webserver"
  org_network_name     = "myNet"
}
```
