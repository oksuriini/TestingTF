terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

resource "kubernetes_deployment" "nginx" {
  metadata {
    name      = "nginx-deployment"
    namespace = "flux-system"
  }
  spec {
    selector {
      match_labels = {
        app = "nginx"
      }
    }
    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }
      spec {
        container {
          name  = "nginx-cont"
          image = "nginx"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_pod" "example" {
  metadata {
    name      = "example"
    namespace = "flux-system"
  }
  spec {
    container {
      name  = "example-cont"
      image = "nginx"
      port {
        container_port = 80
      }
    }
  }
}
