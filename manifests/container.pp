# Manages an LXC container
# @param running|stopped|absent $ensure
# @param string                 $template  LXC template to use
# @param string                 $vgname    volume group to use
# @param string                 $host      host to run the container on (not used a.t.m.)
# @param bool                   $autostart automatically start container at boot
# @param int                    $lvsize    logical volume size in GB
define lxc::container(
    $ensure     = running,
    $template   = undef,
    $vgname     = undef,
    $host       = undef,
    $autostart  = true,
    $lvsize     = 5,
    $filesystem = 'ext4'
    ) {

    if !$host {
        $manage = true
    } elsif $host == $hostname {
        $manage = true
    } else {
        $manage = false
    }

    if $manage {
        case $ensure {
            'running': {
                lxc::container::create { $name:
                    template   => $template,
                    vgname     => $vgname,
                    lvsize     => $lvsize,
                    filesystem => $filesystem
                }
                lxc::container::autostart { $name:
                    autostart => $autostart,
                    require => Lxc::Container::Create[$name];
                }
                lxc::container::state { $name:
                    state   => 'running',
                    require => Lxc::Container::Create[$name];
                }
            }
            'stopped': {
                lxc::container::create { $name:
                    template   => $template,
                    vgname     => $vgname,
                    lvsize     => $lvsize,
                    filesystem => $filesystem
                }
                lxc::container::autostart { $name:
                    autostart => $autostart,
                    require => Lxc::Container::Create[$name];
                }
                lxc::container::state { $name:
                    state   => 'stopped',
                    require => Lxc::Container::Create[$name];
                }
            }
            'absent': {
                lxc::container::state { $name:
                    state   => 'stopped';
                }
                lxc::container::destroy { $name:
                    require => Lxc::Container::State[$name];
                }
                lxc::container::autostart { $name:
                    autostart => false;
                }
            }
        }
    }
}
