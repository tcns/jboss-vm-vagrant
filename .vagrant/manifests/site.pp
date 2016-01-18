class { 'timezone':
    timezone => 'Europe/Moscow',
}

class { 'locales':
    locales  => ['ru_RU.UTF-8 UTF-8'],
}
class apt_install {
    exec {'update':
        command => 'apt-get update',
        path    => '/usr/bin',
        timeout => 0,
    } ->
    package {[
              'vim',
            ]:
            ensure  => installed,
    }
 }
class java_install {
    class { "java":
      jdk            => true,
      jre            => true,
      sources        => true,
      javadoc        => true,
      set_as_default => true,
      export_path    => false,
      vendor         => "oracle",
    }
}
class jboss_install {
  class { 'wildfly':
    version        => '9.0.0',
    install_source => 'http://download.jboss.org/wildfly/9.0.0.Final/wildfly-9.0.0.Final.tar.gz'
  }
}

include apt_install
include timezone
include locales
include java_install
include jboss_install