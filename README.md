# DevOps_Practice
For start\
1. Create VM's (from project directory)
```
vagrant up
```
2. Join to ansible VM
```
vagrant ssh ansible
```
> [!NOTE]
> You can join to every VM from ansible VM\
> just use ssh command(f.e. ssh master)
3. Execute script init-cluster.sh
```
/home/vagrant/init-cluster.sh
```
4. Join to master node and check cluster version
```
ssh master
```
```
kubectl get nodes -o wide
```