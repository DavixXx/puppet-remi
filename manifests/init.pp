# Class: remi
# ===========================
#
# Configure the remi repository and import the GPG keys.
#
# Parameters
# ----------
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# * `ensure`
# Whether the RPM-GPG-KEY-remi file should exist.
#
# * `path`
# The path to the RPM-GPG-KEY-remi file to manage. Must be an absolute path.
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'remi':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
class remi (
  $remi_baseurl                     = absent,
  $remi_mirrorlist                  = "http://rpms.remirepo.net/enterprise/${::operatingsystemmajrelease}/remi/mirror",
  $remi_enabled                     = 1,
  $remi_gpgcheck                    = 1,
  $remi_includepkgs                 = undef,
  $remi_exclude                     = undef,

  $remi_php55_baseurl               = absent,
  $remi_php55_mirrorlist            = "http://rpms.remirepo.net/enterprise/${::operatingsystemmajrelease}/php55/mirror",
  $remi_php55_enabled               = 0,
  $remi_php55_gpgcheck              = 1,
  $remi_php55_includepkgs           = undef,
  $remi_php55_exclude               = undef,

  $remi_php56_baseurl               = absent,
  $remi_php56_mirrorlist            = "http://rpms.remirepo.net/enterprise/${::operatingsystemmajrelease}/php56/mirror",
  $remi_php56_enabled               = 0,
  $remi_php56_gpgcheck              = 1,
  $remi_php56_includepkgs           = undef,
  $remi_php56_exclude               = undef,

  $remi_test_baseurl                = absent,
  $remi_test_mirrorlist             = "http://rpms.remirepo.net/enterprise/${::operatingsystemmajrelease}/test/mirror",
  $remi_test_enabled                = 0,
  $remi_test_gpgcheck               = 1,
  $remi_test_includepkgs            = undef,
  $remi_test_exclude                = undef,

  $remi_debuginfo_baseurl           = "http://rpms.remirepo.net/enterprise/${::operatingsystemmajrelease}/debug-remi/\$basearch/",
  $remi_debuginfo_mirrorlist        = absent,
  $remi_debuginfo_enabled           = 0,
  $remi_debuginfo_gpgcheck          = 1,
  $remi_debuginfo_includepkgs       = undef,
  $remi_debuginfo_exclude           = undef,

  $remi_php55_debuginfo_baseurl     = "http://rpms.remirepo.net/enterprise/${::operatingsystemmajrelease}/debug-php55/\$basearch/",
  $remi_php55_debuginfo_mirrorlist  = absent,
  $remi_php55_debuginfo_enabled     = 0,
  $remi_php55_debuginfo_gpgcheck    = 1,
  $remi_php55_debuginfo_includepkgs = undef,
  $remi_php55_debuginfo_exclude     = undef,

  $remi_php56_debuginfo_baseurl     = "http://rpms.remirepo.net/enterprise/${::operatingsystemmajrelease}/debug-php56/\$basearch/",
  $remi_php56_debuginfo_mirrorlist  = absent,
  $remi_php56_debuginfo_enabled     = 0,
  $remi_php56_debuginfo_gpgcheck    = 1,
  $remi_php56_debuginfo_includepkgs = undef,
  $remi_php56_debuginfo_exclude     = undef,

  $remi_test_debuginfo_baseurl      = "http://rpms.remirepo.net/enterprise/${::operatingsystemmajrelease}/debug-test/\$basearch/",
  $remi_test_debuginfo_mirrorlist   = absent,
  $remi_test_debuginfo_enabled      = 0,
  $remi_test_debuginfo_gpgcheck     = 1,
  $remi_test_debuginfo_includepkgs  = undef,
  $remi_test_debuginfo_exclude      = undef,
){

  require epel

  if ($::osfamily == 'RedHat' and $::operatingsystem !~ /Fedora|Amazon/) {
    yumrepo {
      'remi':
        descr       => "Remi's RPM repository for Enterprise Linux ${::operatingsystemmajrelease} - \$basearch",
        baseurl     => $remi_baseurl,
        mirrorlist  => $remi_mirrorlist,
        enabled     => $remi_enabled,
        gpgcheck    => $remi_gpgcheck,
        gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
        includepkgs => $remi_includepkgs,
        exclude     => $remi_exclude;

      'remi-php55':
        descr       => "Remi's PHP 5.5 RPM repository for Enterprise Linux ${::operatingsystemmajrelease} - \$basearch",
        baseurl     => $remi_php55_baseurl,
        mirrorlist  => $remi_php55_mirrorlist,
        enabled     => $remi_php55_enabled,
        gpgcheck    => $remi_php55_gpgcheck,
        gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
        includepkgs => $remi_php55_includepkgs,
        exclude     => $remi_php55_exclude;

      'remi-php56':
        descr       => "Remi's PHP 5.6 RPM repository for Enterprise Linux ${::operatingsystemmajrelease} - \$basearch",
        baseurl     => $remi_php56_baseurl,
        mirrorlist  => $remi_php56_mirrorlist,
        enabled     => $remi_php56_enabled,
        gpgcheck    => $remi_php56_gpgcheck,
        gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
        includepkgs => $remi_php56_includepkgs,
        exclude     => $remi_php56_exclude;

      'remi-test':
        descr       => "Remi's test RPM repository for Enterprise Linux ${::operatingsystemmajrelease} - \$basearch",
        baseurl     => $remi_test_baseurl,
        mirrorlist  => $remi_test_mirrorlist,
        enabled     => $remi_test_enabled,
        gpgcheck    => $remi_test_gpgcheck,
        gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
        includepkgs => $remi_test_includepkgs,
        exclude     => $remi_test_exclude;

      'remi-debuginfo':
        descr       => "Remi's RPM repository for Enterprise Linux ${::operatingsystemmajrelease} - \$basearch - debuginfo",
        baseurl     => $remi_debuginfo_baseurl,
        mirrorlist  => $remi_debuginfo_mirrorlist,
        enabled     => $remi_debuginfo_enabled,
        gpgcheck    => $remi_debuginfo_gpgcheck,
        gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
        includepkgs => $remi_debuginfo_includepkgs,
        exclude     => $remi_debuginfo_exclude;

      'remi-php55-debuginfo':
        descr       => "Remi's PHP 5.5 RPM repository for Enterprise Linux ${::operatingsystemmajrelease} - \$basearch - debuginfo",
        baseurl     => $remi_php55_debuginfo_baseurl,
        mirrorlist  => $remi_php55_debuginfo_mirrorlist,
        enabled     => $remi_php55_debuginfo_enabled,
        gpgcheck    => $remi_php55_debuginfo_gpgcheck,
        gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
        includepkgs => $remi_php55_debuginfo_includepkgs,
        exclude     => $remi_php55_debuginfo_exclude;

      'remi-php56-debuginfo':
        descr       => "Remi's PHP 5.6 RPM repository for Enterprise Linux ${::operatingsystemmajrelease} - \$basearch - debuginfo",
        baseurl     => $remi_php56_debuginfo_baseurl,
        mirrorlist  => $remi_php56_debuginfo_mirrorlist,
        enabled     => $remi_php56_debuginfo_enabled,
        gpgcheck    => $remi_php56_debuginfo_gpgcheck,
        gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
        includepkgs => $remi_php56_debuginfo_includepkgs,
        exclude     => $remi_php56_debuginfo_exclude;

      'remi-php56-debuginfo':
        descr       => "Remi's PHP 5.6 RPM repository for Enterprise Linux ${::operatingsystemmajrelease} - \$basearch - debuginfo",
        baseurl     => $remi_php56_debuginfo_baseurl,
        mirrorlist  => $remi_php56_debuginfo_mirrorlist,
        enabled     => $remi_php56_debuginfo_enabled,
        gpgcheck    => $remi_php56_debuginfo_gpgcheck,
        gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
        includepkgs => $remi_php56_debuginfo_includepkgs,
        exclude     => $remi_php56_debuginfo_exclude;

      'remi-test-debuginfo':
        descr       => "Remi's test RPM repository for Enterprise Linux ${::operatingsystemmajrelease} - \$basearch - debuginfo",
        baseurl     => $remi_php56_debuginfo_baseurl,
        mirrorlist  => $remi_php56_debuginfo_mirrorlist,
        enabled     => $remi_php56_debuginfo_enabled,
        gpgcheck    => $remi_php56_debuginfo_gpgcheck,
        gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
        includepkgs => $remi_php56_debuginfo_includepkgs,
        exclude     => $remi_php56_debuginfo_exclude;
    }

    class {'remi::rpm_gpg_key':
      ensure => present,
      path   => '/etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
      before => Yumrepo[
        'remi',
        'remi-php55',
        'remi-php56',
        'remi-test',
        'remi-debuginfo',
        'remi-php55-debuginfo',
        'remi-php56-debuginfo',
        'remi-php56-debuginfo',
        'remi-test-debuginfo',
      ],
    }

  } else {
    notice("This remi module does not support ${::operatingsystem}.")
  }

}