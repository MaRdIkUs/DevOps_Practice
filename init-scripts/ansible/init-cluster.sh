ansible-playbook -i /home/vagrant/ansible/hosts /home/vagrant/ansible/prepare-system.yml
ansible-playbook -i /home/vagrant/ansible/hosts /home/vagrant/ansible/install-docker.yml
ansible-playbook -i /home/vagrant/ansible/hosts /home/vagrant/ansible/install-kubernetes.yml
ansible-playbook -i /home/vagrant/ansible/hosts /home/vagrant/ansible/initialize-cluster.yml
ansible-playbook -i /home/vagrant/ansible/hosts /home/vagrant/ansible/upgrade-cluster.yml --extra-vars "major=1 minor=28"
ansible-playbook -i /home/vagrant/ansible/hosts /home/vagrant/ansible/upgrade-cluster.yml --extra-vars "major=1 minor=29"
ansible-playbook -i /home/vagrant/ansible/hosts /home/vagrant/ansible/upgrade-cluster.yml --extra-vars "major=1 minor=30"