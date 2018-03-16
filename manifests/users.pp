group { 'foreman-users':
  ensure => 'present',
} 

file { '/opt/foreman':
	ensure => 'directory',
	force => true,
}

define users {
	file { "/opt/foreman/${name}":
		ensure => 'directory',
		owner => "${name}",
		group => 'foreman-users',
		mode => 2755,
		force => true,
		require => User["${name}"]
	}

	user { "${name}":
		ensure => 'present',
		home => "/opt/foreman/${name}",
		managehome => true,
		require => Group['foreman-users']
	}
}

$myusers = ['rahul', 'anurag', 'kavita', 'nikhil']
users {$myusers:}
