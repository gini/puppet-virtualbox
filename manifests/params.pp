# == Class: virtualbox::params
#
# === Authors
#
# Jochen Schalanda <j.schalanda@smarchive.de>
#
# === Copyright
#
# Copyright 2012, 2013 smarchive GmbH
#
class virtualbox::params {
  $repo_name = $::virtualbox_repo_name ? {
    undef   => 'virtualbox',
    default => $::virtualbox_repo_name
  }

  $repo_baseurl = $::virtualbox_repo_baseurl ? {
    undef   => $::operatingsystem ? {
      'Fedora'          => 'http://download.virtualbox.org/virtualbox/rpm/fedora/$releasever/$basearch',
      'Centos'          => 'http://download.virtualbox.org/virtualbox/rpm/rhel/$releasever/$basearch',
      /(Ubuntu|Debian)/ => 'http://download.virtualbox.org/virtualbox/debian',
      default           => fail("${::operatingsystem} is not supported by ${module_name}")
    },
    default => $::virtualbox_repo_baseurl
  }

  $repo_key = $::virtualbox_repo_key ? {
    undef   => '98AB5139',
    default => $::virtualbox_repo_key
  }

  $repo_key_source = $::virtualbox_repo_key_source ? {
    undef   => $::osfamily ? {
      /(RedHat|Debian)/ => 'http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc',
      default           => fail("${::osfamily} is not supported by ${module_name}")
    },
    default => $::virtualbox_repo_key_source
  }

  $repo_repos = $::virtualbox_repo_repos ? {
    undef   => 'contrib non-free',
    default => $::virtualbox_repo_release
  }

  $repo_release = $::virtualbox_repo_release ? {
    undef   => $::osfamily ? {
      'RedHat' => $::operatingsystemrelease,
      'Debian' => $::lsbdistcodename,
    },
    default => $::virtualbox_repo_release
  }

  $repo_pin = $::virtualbox_repo_pin ? {
    undef   => 200,
    default => $::virtualbox_repo_pin
  }

  $repo_gpgcheck = $::virtualbox_repo_gpgcheck ? {
    undef   => 1,
    default => $::virtualbox_repo_gpgcheck
  }

  $repo_enabled = $::virtualbox_repo_enabled ? {
    undef   => 1,
    default => $::virtualbox_repo_enabled
  }

  $dist_package = $::osfamily ? {
    'RedHat' => 'VirtualBox-4.2',
    'Debian' => 'virtualbox-4.2',
    default  => fail("${::osfamily} is not supported by ${module_name}")
  }

  $package = $::virtualbox_package ? {
    undef   => $dist_package,
    default => $::virtualbox_package
  }

  $version = $::virtualbox_version ? {
    undef   => 'installed',
    default => $::virtualbox_version
  }
}
