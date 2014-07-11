# -*- mode: ruby -*-
# vi: set ft=ruby :

default_box     = 'precise32'
default_box_url = 'http://files.vagrantup.com/precise32.box'

# Node names
nodes = [
  { :hostname => 'webos-desktop',   :ip => '192.168.0.41' },
]
# Network settings (host and domain)
domain   = 'example.org'
# Default memory size
default_memory   = '512'

Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Congifure boxes in loop
  nodes.each do |node|
    # Separate config for each node
    config.vm.define node[:hostname] do |node_config|
      # Set box URL
      box_url = node[:box_url] ? node[:box_url] : default_box_url
      node_config.vm.box_url = box_url

      # Set box name
      box = node[:box] ? node[:box] : default_box
      node_config.vm.box = box

      # Add hostname and domain
      node_config.vm.host_name = node[:hostname] + '.' + domain

      # Assign this VM to a host-only network IP, allowing you to access it
      # via the IP. Host-only networks can talk to the host machine as well as
      # any other machines on the same network, but cannot be accessed (through this
      # network interface) by any external networks.
      node_config.vm.network :hostonly, node[:ip]

      # Tune memory and set VM name
      memory = node[:memory] ? node[:memory] : default_memory;
      node_config.vm.customize [
        'modifyvm', :id,
        '--name', node[:hostname],
        '--memory', memory.to_s
      ]
    end
  end
  
  # Enable provisioning with Puppet stand alone.
  #
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.manifest_file = 'site.pp'
    puppet.module_path = 'puppet/modules'
  end

end
