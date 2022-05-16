variable "certificate_authority" {
  type = any
  default = {}
  description = "A map with the certicate subject configuration."
}

variable "server_certificates" {
  type = any
}