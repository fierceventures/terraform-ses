output "ses_verification_token" {
  value = "${aws_ses_domain_identity.ses.domain}"
}

output "ses_arn" {
  value = "${aws_ses_domain_identity.ses.verification_token}"
}
