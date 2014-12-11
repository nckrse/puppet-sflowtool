class sflowtool {

	case $::osfamily {
		'Debian': {
			file { '/tmp/sflowtool-3.22_amd64.deb':
			ensure => file,
			source => 'puppet:///modules/sflowtool/sflowtool-3.22_amd64.deb',
			owner => root,
			group => root,
		}->
		package { 'sflowtool-3.22_amd64':
			ensure => installed,
			provider => dpkg,
			source => '/tmp/sflowtool-3.22_amd64.deb',
		}
	}
	'RedHat': {
		file { '/tmp/sflowtool-3.22_x86_64.rpm':
			ensure => file,
			source => 'puppet:///modules/sflowtool/sflowtool-3.22_x86_64.rpm',
			owner => root,
			group => root,
		}->
		package { 'sflowtool-3.22_x86_64':
			ensure => installed,
			provider => rpm,
			source => '/tmp/sflowtool-3.22_x86_64.rpm',
		}
	}
	default: {
		fail('The module does not support this OS.')
	}
  }
}