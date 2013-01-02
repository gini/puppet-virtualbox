# == Class: virtualbox::repo
#
# === Authors
#
# Jochen Schalanda <j.schalanda@smarchive.de>
#
# === Copyright
#
# Copyright 2012, 2013 smarchive GmbH
#
class virtualbox::repo(
  $repo_name,
  $baseurl,
  $key,
  $key_source,
  $repos,
  $release,
  $pin,
  $gpgcheck,
  $enabled,
) {
  case $::osfamily {
    'Debian': {
      class { 'virtualbox::repo::debian':
        repo_name  => $repo_name,
        baseurl    => $baseurl,
        release    => $release,
        repos      => $repos,
        key        => $key,
        key_source => $key_source,
        pin        => $pin,
      }
    }
    'RedHat': {
      class { 'virtualbox::repo::redhat':
        repo_name => $repo_name,
        baseurl   => $baseurl,
        gpgkey    => $key_source,
        gpgcheck  => $gpgcheck,
        enabled   => $enabled,
      }
    }
    default:  { fail("${::osfamily} is not supported by ${module_name}") }
  }
}
