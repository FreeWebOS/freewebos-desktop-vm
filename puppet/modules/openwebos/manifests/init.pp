# == Class: openwebos
#
# Installs openwebos desktop
#
class openwebos {
  include apt
  include git

  # Update Aptitude package list
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update';
  }
  ->

  # Clone Open WebOS build repo
  git::repo{'openwebos':
   path   => '/usr/src/openwebos-build-desktop',
   source => 'https://github.com/freewebos/build-desktop.git'
  }
  ->

  ### WebOS desktop prerequisites ###
  # package { "git": ensure => "installed" } -- git puppet module deals with that
  package { "git-core": ensure => "installed" }
  ->
  package { "pkg-config": ensure => "installed" }
  ->
  package { "make": ensure => "installed" }
  ->
  package { "autoconf": ensure => "installed" }
  ->
  package { "libtool": ensure => "installed" }
  ->
  package { "g++": ensure => "installed" }
  ->
  package { "tcl": ensure => "installed" }
  ->
  package { "unzip": ensure => "installed" }
  ->
  package { "libyajl-dev": ensure => "installed" }
  ->
  package { "libyajl1": ensure => "installed" }
  ->
  package { "qt4-qmake": ensure => "installed" }
  ->
  package { "libsqlite3-dev": ensure => "installed" }
  ->
  package { "curl": ensure => "installed" }
  ->

  package { "gperf": ensure => "installed" }
  ->
  package { "bison": ensure => "installed" }
  ->
  package { "libglib2.0-dev": ensure => "installed" }
  ->
  package { "libssl-dev": ensure => "installed" }
  ->
  package { "libxi-dev": ensure => "installed" }
  ->
  package { "libxrandr-dev": ensure => "installed" }
  ->
  package { "libxfixes-dev": ensure => "installed" }
  ->
  package { "libxcursor-dev": ensure => "installed" }
  ->
  package { "libfreetype6-dev": ensure => "installed" }
  ->
  package { "libxinerama-dev": ensure => "installed" }
  ->
  package { "libgl1-mesa-dev": ensure => "installed" }
  ->
  package { "libgstreamer0.10-dev": ensure => "installed" }
  ->
  package { "libgstreamer-plugins-base0.10-dev": ensure => "installed" }
  ->
  package { "flex": ensure => "installed" }
  ->
  package { "libicu-dev": ensure => "installed" }
  ->

  package { "libboost-system-dev": ensure => "installed" }
  ->
  package { "libboost-filesystem-dev": ensure => "installed" }
  ->
  package { "libboost-regex-dev": ensure => "installed" }
  ->
  package { "libboost-program-options-dev": ensure => "installed" }
  ->
  package { "liburiparser-dev": ensure => "installed" }
  ->
  package { "libc-ares-dev": ensure => "installed" }
  ->
  package { "libsigc++-2.0-dev": ensure => "installed" }
  ->
  package { "libglibmm-2.4-dev": ensure => "installed" }
  ->
  package { "libdb4.8-dev": ensure => "installed" }
  ->
  package { "libcurl4-openssl-dev": ensure => "installed" }
  ->

  package { "xcb": ensure => "installed" }
  ->
  package { "libx11-xcb-dev": ensure => "installed" }
  ->
  package { "libxcb-sync0-dev": ensure => "installed" }
  ->
  package { "libxcb1-dev": ensure => "installed" }
  ->
  package { "libxcb-keysyms1-dev": ensure => "installed" }
  ->
  package { "libxcb-image0-dev": ensure => "installed" }
  ->
  package { "libxcb-render-util0-dev": ensure => "installed" }
  ->
  # package { "libxcb-icccm1-dev": ensure => "installed" } -- package is missing from the repo
  package { "libxcb-icccm4-dev": ensure => "installed" }
  ->

  apt::builddep { 'qt4-qmake': }
  ->

  # Set xattr needed for WebOs Email and FileCache
  fstab {'Enable xattr on filesystem':
    source => '/dev/mapper/precise32-root',
    dest => '/',
    type => 'ext4',
    opts => 'user_xattr'
  }
}
