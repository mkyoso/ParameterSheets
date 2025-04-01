terraform {
  required_providers {
    hyperv = {
      source  = "registry.terraform.io/taliesins/hyperv"
      version = "1.2.1"
    }
  }
}

## vm_instance用パラメータ
# hyperv_machine_instance用
variable "VM_NAME" {
  type = string
}
variable "VM_PATH" {
  type = string
}
variable "VM_Gen" {
  type = number
}
variable "PROC_COUNT" {
  type = number
}
variable "MEM_SIZE" {
  type = number
}
variable "VSW_NAME" {
  type = string
}
variable "NOTES" {
  type = string
}
# hyperv_vhd用
variable "VM_DISK_PATH" {
  type = string
}
variable "VM_DISK_SIZE" {
  type = number
}

## リソース定義部
# 1.Hyper-v仮想ディスク作成
resource "hyperv_vhd" "default" {
  path      = var.VM_DISK_PATH
  size = var.VM_DISK_SIZE
}

# 2.Hyper-v仮想マシン作成
resource "hyperv_machine_instance" "default" {
  name                   = var.VM_NAME
  path                   = var.VM_PATH
  generation             = var.VM_Gen
  processor_count        = var.PROC_COUNT
  static_memory          = true
  memory_startup_bytes   = var.MEM_SIZE
  wait_for_state_timeout = 10
  wait_for_ips_timeout   = 10
  notes = var.NOTES

  vm_firmware {
    pause_after_boot_failure = "Off"
  }

  vm_processor {
    expose_virtualization_extensions = true
  }

  network_adaptors {
    name = var.VM_NAME
    switch_name = var.VSW_NAME
    wait_for_ips = false
  }

  hard_disk_drives {
    controller_type     = "Ide"
    path                = var.VM_DISK_PATH
    controller_number   = 0
    controller_location = 0
  }

  dvd_drives {
    controller_number   = 0
    controller_location = 1
  }
}

## 出力定義部
output "debug_print" {
  value = "create to VM: ${hyperv_machine_instance.default.name} ,virtual disk: ${hyperv_vhd.default.path}"
}