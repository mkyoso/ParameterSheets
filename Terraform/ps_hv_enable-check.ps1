# Hyper-V�@�\�L��/�������m�F
<#
  �{�X�N���v�g�͊Ǘ��Ҍ����Ŏ��s���ĉ������B
#>

# Hyper-V�@�\�L�����m�F
$check_feature = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All
if($check_feature.State -eq "Enabled"){
  Write-Host("OK:Hyper-v�@�\�̗L�������m�F")
}
else{
  Write-Host("NG:Hyper-v�@�\���L��������Ă��܂���B")
  Write-Host("Hyper-v�@�\�̗L�������s���܂��B")
  Write-Host("=================")
  Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All
  $check_hyperv = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All
  Write-Host($check_hyperv.State)
  Write-Host("=================")
  Write-Host("Hyper-v�@�\��L�������܂����B�ċN�������{���ĉ������B")
}
