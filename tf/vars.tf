// Change this file according to your cloud infrastructure and personal settings
// All variables in < > should be checked and personalized

variable "nfs_disk_size" {
  default = 10
}

variable "flavors" {
  type = map(any)
  default = {
    "central-manager" = "m1.medium"
    "nfs-server"      = "m1.medium"
    "exec-node"       = "m1.large"
    "gpu-node"        = "m1.small"
  }
}

variable "exec_node_count" {
  default = 1
}

variable "gpu_node_count" {
  default = 0
}

variable "image" {
  type = map(any)
  default = {
    "name"             = "vggp-v60-j225-1a1df01ec8f3-dev"
    "image_source_url" = "https://usegalaxy.eu/static/vgcn/vggp-v60-j225-1a1df01ec8f3-dev.raw"
    // you can check for the latest image on https://usegalaxy.eu/static/vgcn/ and replace this
    "container_format" = "bare"
    "disk_format"      = "raw"
  }
}

variable "gpu_image" {
  type = map(any)
  default = {
    "name"             = "vggp-gpu-v60-j16-4b8cbb05c6db-dev"
    "image_source_url" = "https://usegalaxy.eu/static/vgcn/vggp-gpu-v60-j16-4b8cbb05c6db-dev.raw"
    // you can check for the latest image on https://usegalaxy.eu/static/vgcn/ and replace this
    "container_format" = "bare"
    "disk_format"      = "raw"
  }
}

variable "public_key" {
  type = map(any)
  default = {
    name   = "sanjay_pulsar_test_key"
    pubkey = "ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBACXxIeqhrxBtF8b8G3kMmmYiJVF2ZuiqkFwNrsDxdPurohwRNULB84KAN8N3AIFEXkCH5nX8rHWWu1BbS48chw02wClXK6I/CBU3/gFaxj5Zoj9AI7hwUD6Bmd1vkz2RRMKpvadPp32bcymnh7sbYfqM9nLsfGpgaLVd8gL8GDkwJgi5A== sanjay"
  }
}

variable "name_prefix" {
  default = "vgcn_sanjay_"
}

variable "name_suffix" {
  default = ".pulsar"
}

variable "secgroups_cm" {
  type = list(any)
  default = [
    "sanjay_public-ssh",
    "sanjay_ingress-private",
    "sanjay_public_egress",
  ]
}

variable "secgroups" {
  type = list(any)
  default = [
    "sanjay_ingress-private", //Should open at least nfs, 9618 for HTCondor and 22 for ssh
    "sanjay_public_egress",
  ]
}

variable "public_network" {
  default = "public"
}

variable "private_network" {
  type = map(any)
  default = {
    name        = "vgcn_sanjay_private_test_net"
    subnet_name = "vgcn_sanjay_private_test_subnet"
    cidr4       = "192.168.0.0/24" //This is important to make HTCondor work
  }
}

variable "ssh-port" {
  default = "22"
}

//set these variables during execution terraform apply -var "pvt_key=<~/.ssh/my_private_key>" -var "condor_pass=<MyCondorPassword>"
variable "pvt_key" {}

variable "condor_pass" {}

variable "mq_string" {}
