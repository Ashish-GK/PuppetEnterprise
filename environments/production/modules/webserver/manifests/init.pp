# Class: webserver
# ===========================
#
# Full description of class webserver here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'webserver':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2019 Your name here, unless otherwise noted.
#
class webserver {

 package { 'httpd':
  require => Exec['yum update'],
  ensure => installed,
 }

 exec { 'yum update':
 command => '/usr/bin/yum update -y'
 }

 service { 'httpd':
 require => Package['httpd'],
 ensure => running,
 }

#include user.pp

# execute 'yum-update'
exec { 'yum-update':                    # exec resource named 'yum-update'
  command => '/usr/bin/yum update'  # command this resource will run
}

# install httpd package
package { 'httpd':
  require => Exec['yum-update'],        # require 'yum-update' before installing
  ensure => installed,
}

# ensure httpd service is running
service { 'httpd':
  ensure => running,
}

# install mysql-server package
package { 'mysql-server':
  require => Exec['yum-update'],        # require 'yum-update' before installing
  ensure => installed,
}

# ensure mysql service is running
service { 'mysql':
  ensure => running,
}

# install php5 package
package { 'php5':
  require => Exec['yum-update'],        # require 'yum-update' before installing
  ensure => installed,
}

# ensure info.php file exists
file { '/var/www/html/info.php':
  ensure => file,
  content => '<?php  phpinfo(); ?>',    # phpinfo code
  require => Package['httpd'],        # require 'httpd' package before creating
} 


}
