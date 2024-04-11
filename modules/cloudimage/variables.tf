variable "vms" {
  type = map(object({
    node      = string
    storage   = string
    sockets   = number
    cores     = number
    memory    = number
    disk_size = number
    template  = string
    ip4       = string
  }))
}

variable "ip4gw" {
  type        = string
  description = "ipv4 default gateway"
}

variable "nameserver" {
  type        = string
  description = "nameserver address"
}

variable "user" {
  type        = string
  description = "default user"
}

variable "passwd" {
  type        = string
  description = "default user-password"
  sensitive   = true
}

variable "ssh_keys" {
  type        = string
  description = "ssh key"
}
