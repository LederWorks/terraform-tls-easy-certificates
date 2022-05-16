# Private Key for CA
resource "tls_private_key" "ca_key" {
  algorithm = "RSA"
  rsa_bits = 4096
}

# Self Signed Cert for CA
resource "tls_self_signed_cert" "ca_cert" {
  private_key_pem = tls_private_key.ca_key.private_key_pem
  is_ca_certificate = true
  validity_period_hours = lookup(var.certificate_authority, "validity", 8760)

  allowed_uses = [
    "cert_signing",
    "key_encipherment",
    "digital_signature",
  ]

  subject {
    common_name         = lookup(var.certificate_authority, "common_name")
    country             = lookup(var.certificate_authority, "country", null)
    locality            = lookup(var.certificate_authority, "locality", null)
    organization        = lookup(var.certificate_authority, "organization", null)
    organizational_unit = lookup(var.certificate_authority, "unit", null)
  }
}

#Private Key for Server Certificates
resource "tls_private_key" "cert_key" {
  for_each = var.server_certificates
  algorithm = "RSA"
  rsa_bits = 4096
}

#CSR for Server Certificates
resource "tls_cert_request" "cert_request" {
  for_each = tls_private_key.cert_key

  private_key_pem = tls_private_key.cert_key[each.key].private_key_pem

  subject {
    common_name         = try(each.value.common_name, lookup(var.certificate_authority, "common_name"))
    country             = try(each.value.country, lookup(var.certificate_authority, "country", null))
    locality            = try(each.value.locality, lookup(var.certificate_authority, "locality", null))
    organization        = try(each.value.organization, lookup(var.certificate_authority, "organization", null))
    organizational_unit = try(each.value.unit, lookup(var.certificate_authority, "unit", null))
  }

}

#Server Certificates
resource "tls_locally_signed_cert" "server_cert" {
  for_each = tls_cert_request.cert_request

  cert_request_pem = tls_cert_request.cert_request[each.key].cert_request_pem

  ca_cert_pem = tls_self_signed_cert.ca_cert.cert_pem
  ca_private_key_pem = tls_private_key.ca_key.private_key_pem

  validity_period_hours = try(each.value.validity, lookup(var.certificate_authority, "validity", 8760))

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
}
