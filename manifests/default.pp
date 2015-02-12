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

package { 'express':
  provider => 'npm',
  require  => Package['npm']
}
