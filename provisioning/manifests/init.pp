stage { 'first': 
  before => Stage['main'],
}

class { 'bootload':
  stage => first,
}

package {
  'tree':
    ensure => true;
  'vim':
    ensure => true;
  'git-core':
    ensure => true;
}

file { "/var/www/dev":
  ensure  => "link",
  force   => true,
  target  => "/vagrant/public",
  require => Class["apache"],
}

class { 'apache': }
class { 'mysql::server': }
class { 'php::apache2': }
class { 'logio': }
