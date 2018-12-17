variable "tfkeys" {
  type = "map"
  default = {
    pubkey_prod = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDOhtOv7VGlM86vzePzuW2JaQ3XRxr+KbpObYamBRgKkWiHuYE3tyEn55uvaXiZzNjGdgL6MnW6I8fhqskPuEnbb7SgZb2/GX4uAN99Thi2XfMnfS9rAcgkn8kDI+heZ5a5ecejLyglraVuck47s+7yVdJadmt4djeXZpLXeMgPUXVu+c4iUziqYDN0gCqd9EueAoSEQSNcvk5hiJk/Z6QhSN8gr+tMRJiqYPDO4nwBVItv22v1Jr3oVDyWbnLN1Q8C/SbKL04lJD48c0otDIh1tsn5fbcQRGdXBxsHvbavSVDkqb9jvIvLAOqpm3m+y9/gWVYOt+u6DD7V0cDERhIp"
  }
}

variable "vpc_prdnet_a" {
  type    = "string"
  default = "10.192.0.0/16"
}
variable "prdnet1_a" {
  type    = "string"
  default = "10.192.1.0/24"
}
variable "prdnet2_a" {
  type    = "string"
  default = "10.192.2.0/24"
}

variable "vpc_prdnet_b" {
  type    = "string"
  default = "10.193.0.0/16"
}
variable "prdnet1_b" {
  type    = "string"
  default = "10.193.1.0/24"
}
variable "prdnetr2_b" {
  type    = "string"
  default = "10.193.2.0/24"
}
