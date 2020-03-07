class service_status {

package { 'nano':
  ensure   => 'present',
  provider => 'dnf',
}

package { 'httpd':
  ensure   => 'present',
  provider => 'dnf',
}

service { 'httpd':
  ensure   => 'running',
}

#service { 'puppetserver':
#  ensure => 'running',
#  enable => 'true',
#}

}
