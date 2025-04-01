provider "hyperv" {
  user            = var.HYPERV_USERNAME
  password        = var.HYPERV_PASSWORD
  host            = var.HYPERV_HOST
  port            = var.HYPERV_PORT
  https    = true
  insecure = true
  use_ntlm = true
  timeout         = "30s"
}