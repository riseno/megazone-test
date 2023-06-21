# Install Cluster Autoscaler
helm repo add autoscaler https://kubernetes.github.io/autoscaler
helm repo update

helm install cluster-autoscaler autoscaler/cluster-autoscaler \
    --set 'autoDiscovery.clusterName'=megazone-eks-cluster \
    --namespace clsuter-autoscaler \
    --create-namespace