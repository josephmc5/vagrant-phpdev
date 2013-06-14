class apt {
	file { "/var/cache/apt/archives/":
	  ensure  => "link",
	  force   => true,
	  target  => "/vagrant/cache/archives",
	}

	exec { "apt-get update":
	  path => "/usr/bin",
	  require => File['/var/cache/apt/archives/'],
	}

	exec { "apt-get dist-upgrade -y":
	  path    => ["/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/"],
	  require => Exec['apt-get update'],
	}
}
