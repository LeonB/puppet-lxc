class lxc::config {

    # do package before config
    Class['lxc::package'] -> Class['lxc::config']
}
