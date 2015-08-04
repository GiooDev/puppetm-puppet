# == Class: puppet::repository
#
# This subclass manages the installation of the official repository for puppet
#
# === Authors:
#
# Julien Georges
#
class puppet::repository {

    yumrepo {
        'puppet-products':
            descr          => 'Official products from PuppetLabs',
            baseurl        => "http://yum.puppetlabs.com/el/${::operatingsystemmajrelease}/products/${::architecture}/",
            failovermethod => 'priority',
            gpgcheck       => 0,
            enabled        => 1;
        'puppet-dependencies':
            descr          => 'Official dependencies from PuppetLabs',
            baseurl        => "http://yum.puppetlabs.com/el/${::operatingsystemmajrelease}/dependencies/${::architecture}/",
            failovermethod => 'priority',
            gpgcheck       => 0,
            enabled        => 1;
    }
    #TODO: How to manage requirement to all packages resources ?

}
