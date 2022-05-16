variable "certificate_authority" {
  type = object({
    common_name  = string
    country      = string
    locality     = string
    organization = string
    unit         = string
    validity     = number
  })
}

variable "server_certificates" {
  type = map(any)
}
