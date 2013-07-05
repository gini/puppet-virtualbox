# == Class: virtualbox::repo::redhat
#
# === Authors
#
# Jochen Schalanda <j.schalanda@smarchive.de>
#
# === Copyright
#
# Copyright 2012 smarchive GmbH
#
class virtualbox::repo::redhat(
  $repo_name,
  $baseurl,
  $gpgkey,
  $gpgcheck,
  $enabled,
) {
  yumrepo { $repo_name:
    baseurl  => $baseurl,
    gpgkey   => $gpgkey,
    gpgcheck => $gpgcheck,
    enabled  => $enabled,
    descr    => 'Oracle VirtualBox',
  }
}
