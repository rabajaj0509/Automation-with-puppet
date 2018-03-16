# Automation-with-puppet
This is a basic workshop for beginners to learn puppet.

* Installation Steps
  ~~~~~~~~~~~~~~~~~~

	# yum -y install http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
	you can check for the file puppetlabs.repo in /etc/yum.repos.d/

Server:
~~~~~~~

	# yum install -y puppet-server

	# vi /etc/puppet/puppet.conf
			
		[main]
		dnf_alt_names = puppet, puppet.domain.com. puppetmaster.domain.com
		certname = puppet
	
	# sudo -u puppet puppet master --no-daemonize --verbose

	# systemctl start puppetmaster

	# systemctl enable puppetmaster.service

Client:
~~~~~~~

	# yum install -y puppet

	# vi /etc/puppet/puppet.conf

			[agent]
			server = server.domain.com or server-ip-address

	# puppet agent -t

  # puppet 

Server:
~~~~~~~

	# puppet cert list

	# puppet cert sign client.domain.com

	# systemctl start puppet.service

	# systemctl enable puppet.service

Client:
~~~~~~~

	# puppet agent --fingerprint

