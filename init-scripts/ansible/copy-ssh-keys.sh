mkdir -p /home/vagrant/keys

cp /machines/master/virtualbox/private_key /home/vagrant/keys/master_key
cp /machines/worker1/virtualbox/private_key /home/vagrant/keys/worker1_key
cp /machines/worker2/virtualbox/private_key /home/vagrant/keys/worker2_key

sudo chmod 0400 /keys/*

cat << EOF >/home/vagrant/.ssh/config
Host master
  HostName 172.16.0.1
  User vagrant
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  PasswordAuthentication no
  IdentityFile /home/vagrant/keys/master_key
  IdentitiesOnly yes
  LogLevel FATAL
  PubkeyAcceptedKeyTypes +ssh-rsa
  HostKeyAlgorithms +ssh-rsa

Host worker1
  HostName 172.16.0.11
  User vagrant
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  PasswordAuthentication no
  IdentityFile /home/vagrant/keys/worker1_key
  IdentitiesOnly yes
  LogLevel FATAL
  PubkeyAcceptedKeyTypes +ssh-rsa
  HostKeyAlgorithms +ssh-rsa

Host worker2
  HostName 172.16.0.12
  User vagrant
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  PasswordAuthentication no
  IdentityFile /home/vagrant/keys/worker2_key
  IdentitiesOnly yes
  LogLevel FATAL
  PubkeyAcceptedKeyTypes +ssh-rsa
  HostKeyAlgorithms +ssh-rsa
EOF