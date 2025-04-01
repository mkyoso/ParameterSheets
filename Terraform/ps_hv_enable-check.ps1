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
