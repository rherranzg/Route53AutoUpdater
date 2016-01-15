class route53::config {

  file { "/etc/init.d/dnsRoute53":
    ensure => present,
    source => 'puppet:///modules/route53/dnsRoute53',
    mode => 755,
    owner => root,
    group => root,
  }
  
  file { ["/etc/rc0.d/K10dnsRoute53", "/etc/rc1.d/K10dnsRoute53", "/etc/rc6.d/K10dnsRoute53"] :
    ensure => 'link',
    target => '../init.d/dnsRoute53',
    require => File['/etc/init.d/dnsRoute53'],
  }
  
  file { ["/etc/rc2.d/S97dnsRoute53", "/etc/rc3.d/S97dnsRoute53", "/etc/rc4.d/S97dnsRoute53", "/etc/rc5.d/S97dnsRoute53"] :
    ensure => 'absent'
  }
  

  file { "/usr/sbin/create-dns-route53":
    ensure => present,
    content => template('route53/create-dns-route53.erb'),
    mode => 755,
    owner => root,
    group => root,
  }

  file { "/usr/sbin/delete-dns-route53":
    ensure => present,
    content => template('route53/delete-dns-route53.erb'),
    mode => 755,
    owner => root,
    group => root,
  }
   
  file { "/tmp/template_deletion.json":
    ensure => present,
    content => template('route53/template_deletion.json.erb'),
    mode => 755,
    owner => root,
    group => root,
  }

  file { "/tmp/template_creation.json":
    ensure => present,
    content => template('route53/template_creation.json.erb'),
    mode => 755,
    owner => root,
    group => root,
  }

  file { "/usr/sbin/ip_pub_client.rb":
    ensure => present,
    content => template('route53/ip_pub_client.rb.erb'),
    mode => 755,
    owner => root,
    group => root,
  }

}
