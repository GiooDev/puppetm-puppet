# == Class: puppet::config
#
# This subclass manages all the configuration required for Puppet
#
#   Official documentation : https://docs.puppetlabs.com/references/latest/configuration.html
#
# === Authors:
#
# Julien Georges
#
class puppet::config inherits puppet {

    concat { '/etc/puppet/puppet.conf':
        ensure => present,
    }
    concat::fragment { 'main':
        target  => '/etc/puppet/puppet.conf',
        content => template('puppet/main.erb'),
        order   => '10',
    }

    concat::fragment { 'agent':
        target  => '/etc/puppet/puppet.conf',
        content => template('puppet/agent.erb'),
        order   => '20',
    }

}
