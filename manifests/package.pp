class lxc::package {

    package  { $lxc::packages:
        ensure => $lxc::ensure,
    }

}
