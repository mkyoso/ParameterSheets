#Environment_develop

# Hyper-V接続設定
HYPERV_USERNAME = "Administrator" # Hyper-v Administrator所属ユーザー
HYPERV_PASSWORD = "User Password" # Hyper-v Administrator所属ユーザーパスワード
HYPERV_HOST = "localhost" # 接続Hyper-vマネージャーホスト(ローカルIPアドレスの場合は127.0.0.1)
HYPERV_PORT = 5986 # Hyper-v接続用ポート

## vm_instance用パラメータ
# hyperv_machine_instance用
vm_act_flag = false
NAME = "TEST2"
PATH = "C:\\lab-vm\\" # Hyper-v仮想マシン格納ディレクトリ
#Gen = 1
#CORE_COUNT = 1
#M_SIZE = 536870912
NW_NAME = "dmz"
VM_NOTES = "Test"
# hyperv_vhd用
VHD_DISK_PATH = "C:\\lab-vhd\\" # Hyper-v仮想ハードディスク格納ディレクトリ
#VHD_DISK_SIZE = 21474836480

# hyperv_network_switch用
vsw_act_flag = true
VSW_NW_NAME = "TEST"
VSW_NW_NOTES = "value"
