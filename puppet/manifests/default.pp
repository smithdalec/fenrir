class { 'apt':
  # Need to keep apt-get updated to actually grab npm
  apt_update_frequency => 'weekly',
}

class { 'nodejs': }

# puppetlabs-nodejs is outdated and doesn't include npm...
package { 'npm':
  ensure  => present,
  require => Class['apt']
}

# Express web framework for node
package { 'express':
  provider => 'npm',
  require  => Package['npm']
}

# To allow auto-reloading of the node server when project files change
package { 'nodemon':
  provider => 'npm',
  require  => Package['npm']
}

file { '/usr/bin/node':
  ensure => 'link',
  target => '/usr/bin/nodejs',
}

class { '::mongodb::server': }
