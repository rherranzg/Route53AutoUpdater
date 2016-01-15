class route53::service {
  
  service { 'dnsRoute53':
    ensure => running,
    enable => false,
  }
}
