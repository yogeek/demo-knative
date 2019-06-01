export MINIKUBE_WANTUPDATENOTIFICATION=false 
export MINIKUBE_WANTREPORTERRORPROMPT=false 
export MINIKUBE_HOME=$HOME 
export CHANGE_MINIKUBE_NONE_USER=true 
export MINIKUBE_IN_STYLE=true
mkdir -p $HOME/.kube
mkdir -p $HOME/.minikube
touch $HOME/.kube/config
export KUBECONFIG=$HOME/.kube/config 


# https://istio.io/docs/setup/kubernetes/prepare/platform-setup/minikube/
# https://github.com/kubernetes/minikube/blob/master/docs/vmdriver-none.md#known-issues
sudo -E minikube start --vm-driver=none \
--memory=8192 --cpus=4 \
--extra-config=apiserver.enable-admission-plugins="LimitRanger,NamespaceExists,NamespaceLifecycle,ResourceQuota,ServiceAccount,DefaultStorageClass,MutatingAdmissionWebhook" \
--extra-config=kubelet.resolv-conf=/run/systemd/resolve/resolv.conf

sudo minikube addons enable heapster
sudo minikube addons enable metrics-server

watch kubectl get pods --namespace kube-system
