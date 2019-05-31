kubectl apply --filename https://github.com/knative/serving/releases/download/v0.5.0/istio-crds.yaml &&
curl -L https://github.com/knative/serving/releases/download/v0.5.0/istio.yaml \
  | sed 's/LoadBalancer/NodePort/' \
  | kubectl apply --filename -

# Label the default namespace with istio-injection=enabled.
kubectl label namespace default istio-injection=enabled


watch kubectl get pods --namespace istio-system