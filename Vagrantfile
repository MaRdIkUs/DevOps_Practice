Vagrant.require_version ">=2"

workers_count=2

Vagrant.configure("2") do |config|
  config.vm.define "master" do |master|
    master.vm.hostname = "master"
    master.vm.box = "ubuntu/jammy64"
    master.vm.network "private_network", 
      ip: "172.16.0.1", 
      netmask: "255.255.0.0", 
      virtualbox__intnet: "cluster1"
    master.vm.provider "virtualbox" do |machine|
      machine.memory = "2048"
      machine.cpus = "2"
    end
  end
  (1..workers_count).each do |i|
    config.vm.define "worker#{i}" do |worker|
      worker.vm.hostname = "worker#{i}"
      worker.vm.box = "ubuntu/jammy64"
      worker.vm.network "private_network", 
        ip: "172.16.0.#{i+10}", 
        netmask: "255.255.0.0", 
        virtualbox__intnet: "cluster1"
      worker.vm.provider "virtualbox" do |machine|
        machine.memory = "2048"
        machine.cpus = "1"
      end
    end
  end
  config.vm.define "ansible" do |ansible|
    ansible.vm.hostname = "ansible"
    ansible.vm.box = "ubuntu/jammy64"
    ansible.vm.network "private_network", 
      ip: "172.16.1.1", 
      netmask: "255.255.0.0", 
      virtualbox__intnet: "cluster1"
      ansible.vm.provision "shell", path: ".\\init-scripts\\ansible\\copy-ssh-keys.sh"
      ansible.vm.provision "file", source: ".\\Ansible", destination: "/home/vagrant/ansible"
    ansible.vm.provision "shell", path: ".\\init-scripts\\ansible\\prepare-files.sh"
    ansible.vm.provision "shell", path: ".\\init-scripts\\ansible\\install-ansible.sh"
    ansible.vm.provision "file", source: ".\\init-scripts\\ansible\\init-cluster.sh", destination: "/home/vagrant/init-cluster.sh"
    ansible.vm.provision "shell", run: "always", inline: <<-SHELL
        chmod +x /home/vagrant/init-cluster.sh
      SHELL
    ansible.vm.synced_folder ".\\.vagrant\\machines", "/machines"
    ansible.vm.provider "virtualbox" do |machine|
      machine.memory = "2048"
      machine.cpus = "2"
    end
  end
  #product_uuid should be unique for every machine
end

