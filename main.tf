terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
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
