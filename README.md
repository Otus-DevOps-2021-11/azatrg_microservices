# azatrg_microservices
azatrg microservices repository

## Kubernetes-1. Развертывание Kubernetes

1. Создать 2 инстанса с ubuntu 20.04 со следующими характеристиками - 4 CPU, 4 GB RAM, 40 GB SSD

2. Установить docker на обоих машинах. Docker version 20.10.14

3. Установить latest версии kubernetes (v1.23.5)
```
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
```

4. перед началом установки надо изменить cgroup драйвер докера на systemd в файле
/etc/docker/daemon.json
```
{
    "exec-opts": ["native.cgroupdriver=systemd"]
}
```

и рестартануть докер:
```
sudo systemctl daemon-reload
sudo systemctl restart docker
```


Выполнить команду на на master-node:
```
sudo kubeadm init --pod-network-cidr=10.244.0.0/16
```

5. В случае успешной установки получим дальнейшие инструкции.


6. Следуя инструкции скопировать конфиг:
```
  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

7. Установить сетевой плагин (flannel):
```
kubectl apply -f https://github.com/coreos/flannel/blob/master/Documentation/kube-flannel.yml?raw=true
```

8. Добавить вторую машину (worker node) в кластер:
```
kubeadm join 192.168.233.122:6443 --token oz08ib.2tivux8s5od5izij \
        --discovery-token-ca-cert-hash sha256:320ba761769242dc682f3c46e46c2d7eaa7ddc9af488a1be3c61b6bc298f12c9
```

9. Проверить, что вторая нода теперь тоже в кластере:
```
kubectl get nodes
```
