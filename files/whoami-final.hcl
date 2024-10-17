service {
  name = "whoami"
  port = 8081
  connect {
    sidecar_service {}
  }
  tags = [
    "traefik.enable=true",
    "traefik.http.routers.whoami.rule=PathPrefix(`/whoami`)",
    "traefik.http.routers.whoami.entrypoints=web",
    "traefik.consulcatalog.connect=true",
    "traefik.http.middlewares.whoami-stripprefix.stripPrefix.prefixes=/whoami",
    "traefik.http.routers.whoami.middlewares=whoami-stripprefix"
  ]
  check {
    name     = "Whoami Health Check"
    http     = "http://localhost:8081/api"
    interval = "10s"
    timeout  = "1s"
  }
}
