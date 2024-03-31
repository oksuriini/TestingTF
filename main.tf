resource "kubernetes_pod" "example" {
  metadata {
    name = "example"
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
