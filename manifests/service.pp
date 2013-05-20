class lxc::service {

    service { 'lxc':
        ensure     => running,
        hasstatus  => true,
        hasrestart => true,
        enable     => true,
        require    => Class['lxc::package'],
    }

}
