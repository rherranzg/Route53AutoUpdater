# Route53 Auto Updater

Puppet module which make requests Foreman and Route53 to create and delete public DNS associated with an instance. It uses your machine's hostname, followed by a hyphen ('-') and the value of the Foreman's global scope variable 'ENV' which spacifies the environment (<%= scope['::ENV'] %>) and finally de domain.

This module registers an instance into Route53 when it goes up and unsuscribe it when it's stopped or terminated.

It works with IAM Role permissions. Tested with Route53FullAccess Policy.

Example: myincredibleinstance-pro.mydomain.com
 
## Requires

 * awscli must be installed.
 * IAM Permissions must be set properly with Route53 permissions.
 * This Puppet module must run into a Foreman environment in order to get
   the instance's public IP (future development could avoid this requirement)
 
## Params

### hosted_zone_id

ID of your domain in Route53

### domain

Your domain

