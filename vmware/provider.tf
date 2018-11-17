provider "vsphere" {
  user           = "Administrator@vsphere"
  password       = "vM0tion14#"
  vsphere_server = "resvc-as-01v.email.comcast.net"

  # If you have a self-signed cert
  allow_unverified_ssl = true
}
