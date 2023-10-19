data "vcd_vdc_group" "vdc_group" {
  name = var.vdc_group_name
}

data "vcd_nsxt_edgegateway" "nsxt_edgegateway" {
  org      = var.vdc_org_name
  owner_id = data.vcd_vdc_group.vdc_group.id
  name     = var.vdc_edgegateway_name
}

data "vcd_vapp" "vapp" {
  name = var.vapp_name
  org  = var.vdc_org_name
  vdc  = var.vdc_name
}

data "vcd_network_routed_v2" "network_routed_v2" {
  edge_gateway_id = data.vcd_nsxt_edgegateway.nsxt_edgegateway.id
  name            = var.org_network_name
}

resource "vcd_vapp_org_network" "vapp_org_network" {
  org                    = var.vdc_org_name
  vdc                    = var.vdc_name
  vapp_name              = data.vcd_vapp.vapp.name
  org_network_name       = data.vcd_network_routed_v2.network_routed_v2.name
  reboot_vapp_on_removal = var.reboot_vapp_on_removal
  retain_ip_mac_enabled  = var.retain_ip_mac_enabled
  is_fenced              = var.is_fenced
}
