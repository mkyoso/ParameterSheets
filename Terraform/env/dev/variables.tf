## provider
variable "HYPERV_USERNAME" {
    type = string
    description = "Hyper-vマネージャーに接続するユーザー名"
}
variable "HYPERV_PASSWORD" {
    type = string
    description = "Hyper-vマネージャーに接続するユーザーパスワード"
}
variable "HYPERV_HOST" {
    type = string
    default = "localhost"
    description = "接続するHyper-vホスト(IPアドレス、ホスト名)"
}
variable "HYPERV_PORT" {
    type = number
    default = 5986
    description = "Hyper-vマネージャーに接続する際のポート"
}

## vm_instance用パラメータ
# hyperv_machine_instance用
variable "vm_act_flag" {
    type = bool
    default = false
    description = "インスタンス作成処理のフラグ"
}
variable "instance_count" {
    type        = number
    default     = 1
    description = "起動するインスタンスの数"
}
variable "NAME" {
    type = string
    description = "起動するインスタンスの名前"
}
variable "PATH" {
    type = string
    description = "VMを格納するパス"
}
variable "Gen" {
    type = number
    default = 1
    description = "作成する仮想マシンの世代"
}
variable "CORE_COUNT" {
    type = number
    default = 2
    description = "起動するインスタンスのCPU数"
}
variable "M_SIZE" {
    type = number
    default = 1073741824 #デフォルト1GB
    description = "起動するインスタンスのメモリ(Byte)"
}
variable "NW_NAME" {
    type = string
    default = "Default Switch"
    description = "起動するインスタンスが接続する仮想スイッチの名前"
}
variable "VM_NOTES" {
    type = string
    description = "起動するインスタンスの説明"
}
# hyperv_vhd用
variable "VHD_DISK_PATH" {
    type = string
    description = "起動するインスタンスが使用する仮想ハードディスクの格納パス"
}
variable "VHD_DISK_SIZE" {
    type = number
    default = 42949672960 #デフォルト40GB
    description = "起動するインスタンスが使用する仮想ハードディスクのサイズ(Byte)"
}

## vSW用パラメータ
# hyperv_network_switch用
variable "vsw_act_flag" {
    type = bool
    default = false
    description = "仮想スイッチ作成フラグ"
}
variable "VSW_NW_NAME" {
    type = string
    description = "作成する仮想スイッチ名"
}
variable "VSW_NW_NOTES" {
    type = string
    description = "作成する仮想スイッチの説明"
}