output "certificate_authority_private_key" {
  value = tls_private_key.ca_key.private_key_pem
}

output "certificate_authority_certificate" {
  value = tls_self_signed_cert.ca_cert
}

output "server_certificates" {
  value = tls_locally_signed_cert.server_cert.*
}