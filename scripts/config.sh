#!/bin/sh

#create initial cluster
sudo k3d cluster create iot --agents 2

#create namespaces
sudo kubectl create -f confs/namespaces/dev.yaml
sudo kubectl create -f confs/namespaces/argocd.yaml

#install argocd in argo namespace
sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

#create application pod
sudo kubectl apply -f confs/pod-dev.yaml

