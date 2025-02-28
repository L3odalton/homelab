COMPOSE_PROJECT_NAME=outline-stack
POSTGRES_USER=outlinedbuser
POSTGRES_PASSWORD=op://secrets/outline/env/postgrespassword
POSTGRES_DB=outlinedb

# –––––––––––––––– REQUIRED ––––––––––––––––

NODE_ENV=production

SECRET_KEY=op://secrets/outline/env/secretkey

UTILS_SECRET=op://secrets/outline/env/utilssecret

DATABASE_URL=op://secrets/outline/env/dbconnection
DATABASE_CONNECTION_POOL_MIN=
DATABASE_CONNECTION_POOL_MAX=
PGSSLMODE=disable

REDIS_URL=redis://redis:6379

URL=docs.darksaber.fyi
PORT=443

# See [documentation](docs/SERVICES.md) on running a separate collaboration
# server, for normal operation this does not need to be set.
COLLABORATION_URL=

# Specify what storage system to use. Possible value is one of "s3" or "local".
# For "local", the avatar images and document attachments will be saved on local disk. 
FILE_STORAGE=local

# If "local" is configured for FILE_STORAGE above, then this sets the parent directory under
# which all attachments/images go. Make sure that the process has permissions to create
# this path and also to write files to it.
FILE_STORAGE_LOCAL_ROOT_DIR=/var/lib/outline/data

# Maximum allowed size for the uploaded attachment.
FILE_STORAGE_UPLOAD_MAX_SIZE=262144000

# Override the maximum size of document imports, generally this should be lower
# than the document attachment maximum size.
FILE_STORAGE_IMPORT_MAX_SIZE=

# Override the maximum size of workspace imports, these can be especially large
# and the files are temporary being automatically deleted after a period of time.
FILE_STORAGE_WORKSPACE_IMPORT_MAX_SIZE=

# –––––––––––––– AUTHENTICATION ––––––––––––––

# To configure generic OIDC auth, you'll need some kind of identity provider.
# See documentation for whichever IdP you use to acquire the following info:
# Redirect URI is https://<URL>/auth/oidc.callback
OIDC_CLIENT_ID=op://secrets/outline/env/oidcclientid
OIDC_CLIENT_SECRET=op://secrets/outline/env/oidcclientsecret
OIDC_AUTH_URI=https://id.darksaber.fyi/authorize
OIDC_TOKEN_URI=https://id.darksaber.fyi/api/oidc/token
OIDC_USERINFO_URI=https://id.darksaber.fyi/api/oidc/userinfo
OIDC_LOGOUT_URI=https://id.darksaber.fyi/api/oidc/end-session

# Specify which claims to derive user information from
# Supports any valid JSON path with the JWT payload
OIDC_USERNAME_CLAIM=preferred_username

# Display name for OIDC authentication
OIDC_DISPLAY_NAME=Pocket ID

# Space separated auth scopes.
OIDC_SCOPES=openid profile email


# –––––––––––––––– OPTIONAL ––––––––––––––––

# Base64 encoded private key and certificate for HTTPS termination. This is only
# required if you do not use an external reverse proxy. See documentation:
# https://wiki.generaloutline.com/share/1c922644-40d8-41fe-98f9-df2b67239d45
SSL_KEY=
SSL_CERT=

# If using a Cloudfront/Cloudflare distribution or similar it can be set below.
# This will cause paths to javascript, stylesheets, and images to be updated to
# the hostname defined in CDN_URL. In your CDN configuration the origin server
# should be set to the same as URL.
CDN_URL=

# Auto-redirect to https in production. The default is true but you may set to
# false if you can be sure that SSL is terminated at an external loadbalancer.
FORCE_HTTPS=false

# Have the installation check for updates by sending anonymized statistics to
# the maintainers
ENABLE_UPDATES=false

# How many processes should be spawned. As a reasonable rule divide your servers
# available memory by 512 for a rough estimate
WEB_CONCURRENCY=1


# Configure lowest severity level for server logs. Should be one of
# error, warn, info, http, verbose, debug and silly
LOG_LEVEL=info

# To support sending outgoing transactional emails such as "document updated" or
# "you've been invited" you'll need to provide authentication for an SMTP server
SMTP_HOST=
SMTP_PORT=
SMTP_USERNAME=
SMTP_PASSWORD=
SMTP_FROM_EMAIL=
SMTP_REPLY_EMAIL=
SMTP_TLS_CIPHERS=
SMTP_SECURE=true

# The default interface language. See translate.getoutline.com for a list of
# available language codes and their rough percentage translated.
DEFAULT_LANGUAGE=en_US

# Optionally enable rate limiter at application web server
RATE_LIMITER_ENABLED=false

# Configure default throttling parameters for rate limiter
RATE_LIMITER_REQUESTS=1000
RATE_LIMITER_DURATION_WINDOW=60

# Iframely API config
IFRAMELY_URL=
IFRAMELY_API_KEY=