set -eu

MAJOR=$1
MINOR=$2

curl -fsSL https://pkgs.k8s.io/core:/stable:/v$MAJOR.$MINOR/deb/Release.key | gpg --dearmor --yes -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v$MAJOR.$MINOR/deb/ /" > /etc/apt/sources.list.d/kubernetes.list

apt-mark unhold kubeadm
apt-get update
apt-get install -y kubeadm
apt-mark hold kubeadm

applycmd=$(kubeadm upgrade plan | grep 'kubeadm upgrade apply v')
$applycmd -y

apt-mark unhold kubelet kubectl
apt-get update
NEEDRESTART_MODE=a apt-get install -y kubelet kubectl
apt-mark hold kubelet kubectl

systemctl daemon-reload
systemctl restart kubelet