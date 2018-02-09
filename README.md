# AWS SES

This module can be used to deploy an SES domain for sending emails.

Module Input Variables
----------------------

- `domain` - The domain name to send emails from

Usage 
-----

```hcl
provider "aws" {
  region = "us-east-1"
  alias = "us-east-1"
}

module "ses" {
  source = "github.com/fierceventures/terraform-ses"
  domain = "example.com"
  providers = {
    aws = "aws.us-east-1"
  }
}

resource "aws_route53_record" "example_amazonses_verification_record" {
  zone_id = "ABCDEFGHIJ123"
  name    = "_amazonses.example.com"
  type    = "TXT"
  ttl     = "600"
  records = ["${module.ses.ses_verification_token}"]
}
```

Outputs
-------
- `ses_arn` - The arn of the ses domain
- `ses_verification_token` - The verification token to be added to an aws route53 record

Author
------
Created and maintained by [Fierce Ventures](https://github.com/fierceventures/)
