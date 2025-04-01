# Terraform Hyper-v configuration
# --------------------------------
# local variables

# load Modules
## Create vSW
module "hv_create_vsw" {
  source = "../../modules/hv_create_vsw"

  count = var.vsw_act_flag ? 1 : 0
  VSW_NAME = var.VSW_NW_NAME
  NOTES = var.VSW_NW_NOTES
}

## Create VM
module "hv_create_vm" {
  source = "../../modules/hv_create_vm"

  count = var.vm_act_flag ? 1 : 0
  VM_NAME = var.NAME
  VM_PATH = var.PATH
  VM_Gen = var.Gen
  PROC_COUNT = var.CORE_COUNT
  MEM_SIZE = var.M_SIZE
  VSW_NAME = var.NW_NAME
  NOTES = var.VM_NOTES
  VM_DISK_PATH = format("%s%s.vhdx",var.VHD_DISK_PATH,var.NAME)
  VM_DISK_SIZE = var.VHD_DISK_SIZE
}
