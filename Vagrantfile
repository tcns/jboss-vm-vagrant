Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  #config.vm.network "forwarded_port", guest: 80, host: 8080
  #config.vm.network "private_network", ip: "192.168.33.10"
  # config.vm.network "public_network"
  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "1024"
  end

  config.vm.provision "shell", path: ".vagrant/pre-puppet.sh"
  config.vm.provision :puppet do |puppet|
     puppet.manifests_path = ".vagrant/manifests"
     puppet.manifest_file  = "site.pp"
  end
end
