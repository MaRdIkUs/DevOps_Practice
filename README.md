# DevOps_Practice
After creating VM's vagrant automaticly install all neccesary components
**You shuld do the next steps**
1. Init the kubernetes cluster
```
init-master.sh
```
2. Join worker nodes
3. Install the CNI plugin (on master node)
```bash
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/calico.yaml
```
4. Whait for pods come *running*
```bash
watch kubectl get pods -n kube-system
```
5. Check for nodes are ready
```bash
kubectl get nodes
```
6. Update cluster to version 1.30 using script files
```bash
upgrade-master.sh* - for master node
```
```bash
upgrade-worker.sh* - for worker node
```

> [!NOTE]
>Exaple how to run this scripts:
```bash
*sudo ./upgrade-master.sh 1 28*
```
>Where:\
>1 is Major version\
>28 is Minor version

>[!WARNING]
>Update sequentially!\
>For exampe you have version 1.27\
>First update to 1.28 then to 1.29 etc.