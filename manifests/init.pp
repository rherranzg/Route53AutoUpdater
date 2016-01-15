#
# == Class Route53
#
# Module which make requests to Foreman and Route53 to create and delete
# public DNS. It uses your machine's hostname, followed by a hyphen ('-')
# and the value of the Foreman's global scope variable 'ENV' which spacifies the
# environment (<%= scope['::ENV'] %>) and finally de domain.
#
# It works with IAM Role permissions. Tested with Route53FullAccess Policy
#
# Example:
# myincredibleinstance-pro.mydomain.com
# 
# == Requires
# 
# * awscli must be installed.
# * IAM Permissions must be set properly with Route53 permissions.
# * This Puppet module must run into a Foreman environment in order to get
#   the instance's public IP (future development could avoid this requirement)
# 
# == Params
#
#  hosted_zone_id
# ID of your domain in Route53
#
#  domain
# Your bought domain
#

class route53 (
	$hosted_zone_id = '123456789ABCDEF',
	$domain = 'example.com',
) {

  include 'route53::config'
  include 'route53::service'

  Class['awscli'] ->
  Class['route53::config'] ~>
  Class['route53::service'] ->
  Class['route53']
}
