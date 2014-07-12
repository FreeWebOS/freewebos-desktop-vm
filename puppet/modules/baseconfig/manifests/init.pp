# == Class: baseconfig
#
# Performs initial configuration tasks for all Vagrant boxes.
#
class baseconfig {
  include apt

  # # Libaugeas for the puppet client
  # package {"libaugeas-ruby": ensure => latest }
  # ->
  # Ensure latest puppet client
  package { "puppet": ensure => latest }

  # Install vim for debugging 
  package { "vim": ensure => "installed" }

  # Install xterm for debugging 
  package { "xterm": ensure => "installed" }

  host { 'hostmachine':
    ip => '192.168.0.1';
  }

  file {
    '/home/vagrant/.bashrc':
      owner => 'vagrant',
      group => 'vagrant',
      mode  => '0644',
      source => 'puppet:///modules/baseconfig/bashrc';
  }
}
