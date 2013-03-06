class video_device::vendor::amd
{
    $pref_free        = 'xf86_video_ati'
    $pref_proprietary = 'catalyst'

    class catalyst
    {
    	video_device::driver { 'video_device_amd_catalyst':
    		driver => $lsbdistid ? {
    			'Debian' => ['fglrx-driver', 'fglrx-modules-dkms'],
    			'Ubuntu' => ['fglrx'],
    		},
    		control     => ['fglrx-control'],
    		video_accel => ['xvba-va-driver'],
            type        => 'proprietary'
    	}
    }

    class xf86_video_ati
    {
        video_device::driver { 'video_device_amd_xf86_video_ati':
            driver      => 'xserver-xorg-video-ati',
            type        => 'free'
        }
    }
}
