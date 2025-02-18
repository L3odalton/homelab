# see https://docs.searxng.org/admin/settings/settings.html#settings-use-default-settings
use_default_settings: true
server:
  # base_url is defined in the SEARXNG_BASE_URL environment variable, see .env and docker-compose.yml
  secret_key: "op://secrets/gluetunstack/env/searxngprivatekey"  # change this!
  limiter: false  # can be disabled for a private instance
  image_proxy: true
ui:
  static_use_hash: true
#redis:
#  url: redis://redis:6379/0