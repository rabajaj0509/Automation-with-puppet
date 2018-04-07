# Automation-with-puppet
This is a basic workshop for beginners to learn puppet5. 

Inside the set-up folder, you will find the server and the client files. Both these files
contain the Vagrant file. You need to `vagrant up` in both the folders(server and client).

Note: Vagrant must be installed with libvirt as provider to perform this workshop.

Once vagrant up command is complete run `vagrant ssh`. You are now inside the centos machine
that you just created! 

Become root by `su` command(password=vagrant) and follow the commands given bellow.

## Make sure time on both the machines are synced. (Run this on both client & server machines)
~~~

	# yum -y install ntpdate
	# yum 0.centos.pool.ntp.org
	#timedatectl set-timezone Asia/Kolkata

~~~

## Create Flat dns. (Run this on both client & server machines)
~~~

	# ifconfig
	# put the ip address in /etc/hosts with the name `puppet-master puppet-master.exmaple.com`
	  for server and `puppet-agent` for client
	  
	Note : If ifconfig command does nto exist, then install `net-tools` package.
	

~~~

## Installation Steps. (run this on both client and server machines)
~~~

	# rpm -Uvh http://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm
	you can check for the file puppetlabs.repo in /etc/yum.repos.d/

~~~

## Server:
~~~

	# yum install -y puppetserver
	
	# vi /etc/sysconfig/puppetserver
		
		change the memory values to `1g`
		JAVA_ARGS = "-Xms1g -Xmx1g ....."
	
	# vi /etc/puppetlabs/puppet/puppet.conf (add these lines at the end of the file)
			
		dnf_alt_names = puppet-master, puppet-master.example.com
		certname = puppetcert1
	
	# systemctl start puppetserver.service

	# systemctl enable puppetserver.service
~~~

## Client:
~~~

	# yum install -y puppet

	# vi /etc/puppetlabs/puppet/puppet.conf
	
		server = puppet-master.example.com
	
	# /opt/puppetlabs/bin/puppet resource service puppet ensure=running
~~~

## Server:
~~~

	# /opt/puppetlabs/bin/puppet cert list

	# /opt/puppetlabs/bin/puppet cert sign <client-name-mentioned-in-cert>
	
~~~
## Client:
~~~

	# /opt/puppetlabs/bin/puppet agent -t

~~~

## happy hacking :)
