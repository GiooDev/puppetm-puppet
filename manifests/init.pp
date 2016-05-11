# == Class: puppet
#
# Full description of class puppet here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#    class { 'puppet':
#        repository => false,
#        ssldir     => '/var/lib/puppet/ssl',
#    }
#    class { 'puppet::server':
#        enable          => false,
#        ensure          => 'stopped',
#        passenger       => true,
#        environmentpath => '$confdir/environments',
#        external_nodes  => '/usr/local/bin/puppet_node_classifier',
#        certname        => 'puppet',
#        dns_alt_names   => 'puppetmaster01,puppetmaster01.example.com,puppet,puppet.example.com',
#        ssldir          => '/var/lib/puppet/ssl_master',
#    }
#
# === Authors
#
# Julien Georges <GiooDev@users.noreply.github.com>
#
# === Copyright
#
# Copyright 2016 Julien Georges
#
class puppet (
    $ssldir        = '/var/lib/puppet/ssl',
    $repository    = true,
    $puppet_server = undef,
) {

    # Allow selection of repository configuration
    if $repository {
        require puppet::repository
    }

    include puppet::install
    include puppet::config
    Class['puppet::install'] ->
    Class['puppet::config']

}
