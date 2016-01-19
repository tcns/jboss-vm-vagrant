Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  end
  config.vm.network :private_network, ip: "192.168.100.5"
  config.vm.hostname = "config.example.com"
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "1024"
  end

  config.vm.provision "shell", path: ".vagrant/pre-puppet.sh"
  config.vm.provision "shell", path: ".vagrant/puppet-packages.sh"
  config.vm.provision :puppet do |puppet|
     puppet.manifests_path = ".vagrant/manifests"
     puppet.manifest_file  = "site.pp"
  end
  config.vm.provision "shell", path: ".vagrant/start-server.sh"
end
