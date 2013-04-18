# == Class: virtualbox::repo::debian
#
# === Authors
#
# Jochen Schalanda <j.schalanda@smarchive.de>
#
# === Copyright
#
# Copyright 2012, 2013 smarchive GmbH
#
class virtualbox::repo::debian (
  $repo_name,
  $baseurl,
  $release,
  $repos,
  $key,
  $key_source,
  $pin
) {
  apt::source { $repo_name:
    location    => $baseurl,
    release     => $release,
    repos       => $repos,
    key         => $key,
    key_source  => $key_source,
    pin         => $pin,
    include_src => false,
  }
}
