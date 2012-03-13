class jmeter {

  package { "jmeter": 
    ensure => latest, 
  }

  file { "/etc/init.d/jmeter-server":
    owner   => root,
    group   => root,
    mode    => 755,
    source  => "puppet:///modules/jmeter/jmeter-server",
    require => Package["jmeter"],
    notify  => Service["jmeter-server"],
  }

  service{ "jmeter-server":
    enable  => true,
    ensure  => running,
    require => Package["jmeter"],
  }

}
