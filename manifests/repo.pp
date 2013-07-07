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

  anchor { 'virtualbox::repo::begin': }
  anchor { 'virtualbox::repo::end': }

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
        require => Anchor['virtualbox::repo::begin'],
        before => Anchor['virtualbox::repo::end'],
      }
    }
    'RedHat': {
      class { 'virtualbox::repo::redhat':
        repo_name => $repo_name,
        baseurl   => $baseurl,
        gpgkey    => $key_source,
        gpgcheck  => $gpgcheck,
        enabled   => $enabled,
        require => Anchor['virtualbox::repo::begin'],
        before => Anchor['virtualbox::repo::end'],
      }
    }
    default:  { fail("${::osfamily} is not supported by ${module_name}") }
  }
}
