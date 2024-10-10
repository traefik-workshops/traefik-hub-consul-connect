service {
  name = "traefik"
  port = 80
  connect {
    sidecar_service {}
  }
  tags = ["traefik.enable=true"]
  check {
    name     = "Traefik Health Check"
    http     = "http://localhost:8080/ping"
    interval = "10s"
    timeout  = "1s"
  }
}
