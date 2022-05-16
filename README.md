<!-- BEGIN_TF_DOCS -->
<!-- markdownlint-disable-file MD033 MD012 -->
# terraform-tls-easy-self-signed-cert
Easy TLS Certificates

# Authors
  - [Bence Bánó](mailto:bence.bano@lederworks.com)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15.1 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tls"></a> [tls](#provider\_tls) | >= 3.1.0 |

## Example

```hcl
terraform {
  required_providers {
    tls = {
      source = "hashicorp/tls"
      version = ">= 3.1.0"
    }
  }
  required_version = ">= 0.15.1"
}

module "easy-certificates" {
  source = "../"

  certificate_authority = {
    common_name = "gdp.allianz"
    country = "DE"
    locality = "Munich"
    organization = "Allianz"
    unit = "GDP"
    validity = 87600 # 10 Years
  }

  server_certificates = {
      server0 = {
        common_name = "server0"
        country = "HU"
        locality = "Budapest"
        organization = "LederWorks"
        unit = "IaC"
        validity = 8760
      }

      server1 = {
        common_name = "server1"
        country = "DE"
        locality = "Munich"
        organization = "Allianz"
        unit = "GDP"
        validity = 8760
      }

      server2 = {
        common_name = "server2"
      }
  }

}

```

## Resources

| Name | Type |
|------|------|
| [tls_cert_request.cert_request](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/cert_request) | resource |
| [tls_locally_signed_cert.server_cert](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/locally_signed_cert) | resource |
| [tls_private_key.ca_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [tls_private_key.cert_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [tls_self_signed_cert.ca_cert](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/self_signed_cert) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_certificate_authority"></a> [certificate\_authority](#input\_certificate\_authority) | n/a | <pre>object({<br>    common_name  = string<br>    country      = string<br>    locality     = string<br>    organization = string<br>    unit         = string<br>    validity     = number<br>  })</pre> | n/a | yes |
| <a name="input_server_certificates"></a> [server\_certificates](#input\_server\_certificates) | n/a | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_certificate_authority_certificate"></a> [certificate\_authority\_certificate](#output\_certificate\_authority\_certificate) | n/a |
| <a name="output_certificate_authority_private_key"></a> [certificate\_authority\_private\_key](#output\_certificate\_authority\_private\_key) | n/a |

## Contributing

* If you think you've found a bug in the code or you have a question regarding
  the usage of this module, please reach out to us by opening an issue in
  this GitHub repository.
* Contributions to this project are welcome: if you want to add a feature or a
  fix a bug, please do so by opening a Pull Request in this GitHub repository.
  In case of feature contribution, we kindly ask you to open an issue to
  discuss it beforehand.

## License & Authors

Author: Bence Bánó (@Ledermayer)

```text
MIT License

Copyright (c) 2022 LederWorks

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
<!-- END_TF_DOCS -->