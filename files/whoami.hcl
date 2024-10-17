service {
  name = "whoami"
  port = 8081
  connect {
    sidecar_service {}
  }
  tags = ["traefik.enable=true"]
  check {
    name     = "Whoami Health Check"
    http     = "http://localhost:8081/api"
    interval = "10s"
    timeout  = "1s"
  }
}
