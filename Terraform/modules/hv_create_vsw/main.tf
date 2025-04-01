terraform {
  required_providers {
    hyperv = {
      source  = "registry.terraform.io/taliesins/hyperv"
      version = "1.2.1"
    }
  }
}

## vsw-manager_action用パラメータ
# hyperv_network_switch用
variable "VSW_NAME" {
  type = string
}
variable "NOTES" {
  type = string
}

## リソース定義部
resource "hyperv_network_switch" "default" {

  name = var.VSW_NAME
  notes = var.NOTES
  allow_management_os = true
  enable_embedded_teaming = false
  enable_iov = false
  enable_packet_direct = false
  minimum_bandwidth_mode = "None"
  switch_type = "Internal"
  net_adapter_names = []
  default_flow_minimum_bandwidth_absolute = 0
  default_flow_minimum_bandwidth_weight = 0
  default_queue_vmmq_enabled = false
  default_queue_vmmq_queue_pairs = 16
  default_queue_vrss_enabled = false
}

## 出力定義部
output "debug_print" {
  value = "create to vSW_Name: ${hyperv_network_switch.default.name} ,switch_type: ${hyperv_network_switch.default.switch_type}"
}