# == Class: puppet::install
#
# This subclass manages the installation of Puppet packages
#
# === Authors:
#
# Julien Georges
#
class puppet::install {

    package { 'puppet':
        ensure  => present,
    }

}
