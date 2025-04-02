<!-- プロジェクト名を記載 -->

# Hyper-V 環境構築用 Terraform

## 使用技術一覧

<!-- シールド一覧を記載 -->

[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)
[![Terraform](https://img.shields.io/badge/-Terraform-007ACC.svg?logo=terraform&style=flat)](Code) [![Powershell](http://img.shields.io/badge/shell-Powershell-red.svg?style=flat)](code)
[![Hyper-v](http://img.shields.io/badge/Virtualization-Hyperv-Green.svg?style=flat)](Virtualization)

---

<!-- 目次を記載 -->

## 目次

- [概要](#概要)
- [変数一覧](#変数一覧)
- [モジュール一覧](#モジュール一覧)
- [導入方法](#導入方法)
- [トラブルシューティング](#トラブルシューティング)

---

<!-- プロジェクトの説明を記載 -->

### 概要

Terraform Hyper-V プロバイダを用いた Hyper-v 環境構築支援テンプレートとなります。<br>
<br>
利用する Terraform プロバイダは Taliesins 氏作成のコミュニティプロバイダ < [Github_Link](https://github.com/taliesins/terraform-provider-hyperv) > を使用します。<br>
このプロバイダでは仮想マシン作成、仮想スイッチ作成の作成に加え、仮想ハードディスクの作成を行うことが可能です。<br>
<br>
今回モジュール化している処理は 2 種となります。<br>
1 つは新規に仮想マシンを構築するモジュールとなり、過疎マシンおよび、仮想ハードディスク作成処理が実行されます。<br>
この際、仮想マシン CPU に関して入れ子仮想化が有効にしています。<br>
<br>
2 つ目は仮想スイッチの作成処理となります。<br>
仮想スイッチ作成処理は仮想マシン作成処理前に実行して下さい。<br>
仮想マシン作成時の仮想ネットワークアダプタに作成済み仮想スイッチへの接続を行う際に事前に必要となります。<br>
<br>

---

### 変数一覧

各処理時に使用する変数は env 配下の環境ディレクトリ(dev)内に配備している"terraform.ftvars"で定義しています。<br>
仮想マシン作成に使用する変数を以下表に記載します。<br>

| 変数名       | 型     | 備考                                                                         |
| :----------- | :----- | :--------------------------------------------------------------------------- |
| VM_NAME      | string | 仮想マシン名                                                                 |
| VM_PATH      | string | Hyper-v 設定の仮想マシン格納パス                                             |
| VM_Gen       | number | 仮想マシン世代指定(標準：1 世代)                                             |
| PROC_COUNT   | number | 仮想マシン CPU コア数(標準：2)                                               |
| MEM_SIZE     | number | 仮想マシン メモリサイズ(標準：1GB)※設定は Byte 表記                          |
| VSW_NAME     | string | 仮想マシンネットワークアダプタが接続する仮想スイッチ名(標準：Default Switch) |
| NOTES        | string | 仮想マシンの説明                                                             |
| VM_DISK_PATH | string | Hyper-v 設定の仮想ハードディスク格納パス                                     |
| VM_DISK_SIZE | number | 仮想マシン ディスクサイズ(標準：40GB)※設定は Byte 表記                       |

<br>
仮想スイッチ作成ではスイッチタイプを「内部(Internal)」固定にしています。
その為、作成必要となる変数は名前、説明欄のみになります。<br>
仮想スイッチ作成に使用する変数を以下表に記載します。
<br>

| 変数名 　　　 | 型     | 備考                     |
| :------------ | :----- | :----------------------- |
| VSW_NW_NAME   | string | 仮想スイッチの名前       |
| NOTES         | string | 仮想スイッチ作成時の説明 |

---

<!-- 実装機能の概要を記載 -->

### モジュール一覧

本構成でモジュール化している機能は以下の通り。<br>

1. 仮想マシンインスタンス作成 … hv_create_vm
2. 仮想スイッチ作成 … hv_create_vsw

各モジュールの概要はモジュールディレクトリ内の README を参照ください。<br>
ディレクトリ構成は以下となります。

<!-- ディレクトリ構成を記載 -->

📦Terraform  
┣ 📂env  
┃ ┣ 📂dev  
┃ ┃ ┣ 📜main.tf  
┃ ┃ ┣ 📜provider.tf  
┃ ┃ ┣ 📜terraform.tf  
┃ ┃ ┣ 📜terraform.tfvars  
┃ ┃ ┗ 📜variables.tf  
┃ ┣ 📂plod  
┃ ┗ 📂stg  
┣ 📂modules  
┃ ┣ 📂hv_create_vm  
┃ ┃ ┣ 📜main.tf  
┃ ┃ ┗ 📜README.md  
┃ ┗ 📂hv_create_vsw  
┃ ┃ ┣ 📜main.tf  
┃ ┃ ┗ 📜README.md  
┗ 📜README.md  

---

<!-- 導入補法を記載 -->

### 導入方法

Windows 版 Terraform 導入と Hyper-v の有効化を行う必要があります。<br>
<br>

#### Windows版Terraform導入

以下、Terraform公式サイトよりWindowsインストーラーをダウンロードして下さい。<br>
[Terraform公式サイト](https://www.terraform.io/downloads)<br>
ダウンロード後、任意の場所に展開します。<br>
必要に応じてterraform.exeのPathを環境設定に登録しTerraform導入は完了です。<br>

#### Hyper-v 有効化

Hyper-v 有効化はディレクトリ内の「ps_hv_enable-check.ps1」にて確認できます。<br>
スクリプトでは Hyper-v 有効化も併せて行えるようにしています。<br>
「ps_hv_enable-check.ps1」の Powershell スクリプト内容を記載します。<br>

```powershell
# Hyper-V機能有効/無効化確認
<#
  本スクリプトは管理者権限で実行して下さい。
#>

# Hyper-V機能有効化確認
$check_feature = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All
if($check_feature.State -eq "Enabled"){
  Write-Host("OK:Hyper-v機能の有効化を確認")
}
else{
  Write-Host("NG:Hyper-v機能が有効化されていません。")
  Write-Host("Hyper-v機能の有効化を行います。")
  Write-Host("=================")
  Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All
  $check_hyperv = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All
  Write-Host($check_hyperv.State)
  Write-Host("=================")
  Write-Host("Hyper-v機能を有効化しました。再起動を実施して下さい。")
}
```

Hyper-v を有効化した後に Hyper-v マネージャーへのリモート接続を可能にする必要があります。<br>
Terraform Hypre-v プロバイダでは NTLM、Kerberos 認証による接続が有効化されている必要があります。<br>
接続認証有効化、ならびに確認方法を以下に記載します。<br>
<br>

```powershell
<#
  以下のコマンドはローカル端末上でHyper-v環境を実施する場合も行ってください。
#>
# WinRMの有効化
<#
  Windowsのネットワークプロファイルがパブリックドメインネットワークの場合は「-SkipNetworkProfileCheck」を入れて下さい。
  そうでない場合、"Enable-PSRemoting -Force"で有効化されます。
#>
Enable-PSRemoting -SkipNetworkProfileCheck -Force

# CredSSPとWinRMファイアウォール規則を有効化
<#
  "-Value""-DelegateComputer"を「*」に設定することですべてのサーバに対して有効化されます。
  Hyper-vマネージャー接続にはポート「5985」「5986」を使用します。
  ファイアウォールにて上記ポートを開いておいてください。
#>
Enable-WSManCredSSP -Role server
Set-Item WSMan:\localhost\Client\TrustedHosts -Value "*"
Enable-WSManCredSSP -Role client -DelegateComputer "*"
New-NetFirewallRule -Name "Allow PowerShell Remoting" -DisplayName "Allow PowerShell Remoting" -Enabled True -Direction Inbound -Protocol TCP -LocalPort 5985,5986

```

<!-- トラブル時の対処法を記載 -->

### トラブルシューティング

- terraform aplly 実行時"wsarecv: An existing connection was forcibly closed by the remote host."もしくは"401"エラーが表示される場合は WinRM の接続構成を確認して下さい。
