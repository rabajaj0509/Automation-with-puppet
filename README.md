# Automation-with-puppet
This is a basic workshop for beginners to learn puppet. 

Inside the set-up folder, you will find the server and the client files. Both these files
contain the Vagrant file. You need to `vagrant up` in both the folders(server and client). 

Once vagrant up command is complete run `vagrant ssh`. You are now inside the centos machine
that you just created! 

Become root by `su` command(password=vagrant) and follow the commands given bellow.

## Installation Steps
~~~

	# yum -y install http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
	you can check for the file puppetlabs.repo in /etc/yum.repos.d/

~~~

## Server:
~~~

	# yum install -y puppet-server

	# vi /etc/puppet/puppet.conf
			
		[main]
		dnf_alt_names = puppet, puppet.domain.com. puppetmaster.domain.com
		certname = puppet
	
	# sudo -u puppet puppet master --no-daemonize --verbose

	# systemctl start puppetmaster

	# systemctl enable puppetmaster.service
~~~

## Client:
~~~

	# yum install -y puppet

	# vi /etc/puppet/puppet.conf

			[agent]
			server = server.domain.com or server-ip-address

	# puppet agent -t
~~~

## Server:
~~~

	# puppet cert list

	# puppet cert sign client.domain.com

	# systemctl start puppet.service

	# systemctl enable puppet.service

~~~
## Client:
~~~

	# puppet agent --fingerprint

~~~

## happy hacking :)
