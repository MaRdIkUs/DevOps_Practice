Vagrant.require_version ">=2"

Vagrant.configure("2") do |config|
  config.vm.define "master" do |master|
    master.vm.hostname = "master"
    master.vm.box = "ubuntu/jammy64"
    master.vm.network "private_network", 
      ip: "172.16.0.1", 
      netmask: "255.255.0.0", 
      virtualbox__intnet: "cluster1"
    master.vm.provision "shell", path: "disable-swap.sh"
    master.vm.provision "shell", path: "prepare-system.sh"
    master.vm.provision "shell", path: "install-docker.sh"
    master.vm.provision "shell", path: "install-k8s.sh"
    master.vm.provider "virtualbox" do |machine|
      machine.memory = "2048"
      machine.cpus = "2"
    end
  end
  (1..2).each do |i|
    config.vm.define "worker#{i}" do |worker|
      worker.vm.hostname = "worker#{i}"
      worker.vm.box = "ubuntu/jammy64"
      worker.vm.network "private_network", 
        ip: "172.16.0.#{i+10}", 
        netmask: "255.255.0.0", 
        virtualbox__intnet: "cluster1"
      worker.vm.provision "shell", path: "disable-swap.sh"
      worker.vm.provision "shell", path: "prepare-system.sh"
      worker.vm.provision "shell", path: "install-docker.sh"
      worker.vm.provision "shell", path: "install-k8s.sh"
      worker.vm.provider "virtualbox" do |machine|
        machine.memory = "2048"
        machine.cpus = "1"
      end
    end
  end
  #product_uuid should be unique for every machine
end

