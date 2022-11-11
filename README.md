# shopkart-k8s
project to deploy a sample shopping service in k8s cluster

# Deployment statment

### Task

* Deploy multiple services (shop, cart, checkout, payment) to a Kubernetes cluster.
* Each of these services when accessed via the browser must display the message - "Service name: <service-name>".
* Use Docker to build one image for the above services.
* Use Prometheus and Grafana to monitor cluster and service health.

## Deployment Instructions

1. Setup local env for code development and testing:

   `$ source init_local.sh`

2. Build container image using the `Dockerfile`
    `$ source build.push.image`

3. Create helm chart and update as per the requirement
    ```
    $ helm create shoppapp
    $ helm install app shoppapp
    ```
4. Make any changes and then upgrade to reflect the deployment
    ```
    $ helm upgrade app shoppapp
    ```
5. Access your app using either port-forward or by accessing the node port directly. The following are proofs using forwarding.

    ```
    $ kubectl port-forward deploy/shop-app 5000
    ```
    > 1. If using node port the service is available via nodeip:nodeport
    > `e.g: 10.43.88.102:32231` 
    > 2. The port number is different and if not specified a random port will be given.

## Monitoring setup
### Install Prom Stack
1. Install using Helm
    ```
    $ helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
    $ helm repo update
    $ helm install prometheus prometheus-community/kube-prometheus-stack -n mon --create-namespace 
    ```
2. Explore Grafan dashboard using port-forward
    ```
    $ kubectl port-forward deploy/prometheus-grafana 3000 -n mon
    ```