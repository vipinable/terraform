provider "vsphere" {
  user           = "Administrator@vsphere"
  password       = "password"
  vsphere_server = "vecnter-server"

  # If you have a self-signed cert
  allow_unverified_ssl = true
}
