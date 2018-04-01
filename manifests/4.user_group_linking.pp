group { 'foss-world':
  ensure => 'present',
}

file { '/opt/foss-user':
        ensure => 'directory',
        owner => 'foss-user',
        group => 'foss-world',
        mode => 2755,
        force => true,
        require => User['foss-users']
}

user { 'foss-users':
        ensure => 'present',
        home => '/opt/foss-users',
        managehome => true,
	groups => ['foss-world'],
        require => Group['foss-world']
}

