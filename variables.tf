variable "vdc_org_name" {
  description = "The name of the organization to use."
  type        = string
}

variable "vdc_name" {
  description = "The name of VDC to use."
  type        = string
  default     = null
}

variable "vapp_name" {
  description = "The vApp this Org network belongs to."
  type        = string
}

variable "org_network_name" {
  description = "An Org network name to which vApp network is connected. If not configured, then an isolated network is created."
  type        = string
  default     = null
}

variable "is_fenced" {
  description = "Fencing allows identical virtual machines in different vApp networks connect to organization VDC networks that are accessed in this vApp."
  type        = bool
  default     = false
}

variable "retain_ip_mac_enabled" {
  description = "Specifies whether the network resources such as IP/MAC of router will be retained across deployments. Configurable when is_fenced is true."
  type        = bool
  default     = false
}

variable "reboot_vapp_on_removal" {
  description = "(VCD 10.4.1+) API prohibits removal of vApp network from a powered on vApp. Set to true to power off the vApp during vApp network removal. If the vApp's original state was powered on, it will be powered back on after removing the network. (default false) Note. It only affects delete operation for the resource and will never power cycle vApp during update operations. Changing this value will cause plan change, but update will be a no-op operation."
  type        = bool
  default     = false
}

variable "vdc_edgegateway_name" {
  type        = string
  description = "Name of the Edge Gateway the Org Network is connected to."
}
variable "vdc_group_name" {
  description = "Data Center Group that the Edge Gateway belongs to."
  type        = string
}
