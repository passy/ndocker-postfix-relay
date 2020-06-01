# ndocker-postfix-relay

> Simple postfix relay for use with nomad.

## Env Variables for Configuration

Variable | Description | Notes
---|---|---
POSTFIX_MYHOSTNAME | postfix myhostname |
POSTFIX_MXHOSTNAME | domain name that letsencrypt certs were issued for, usually prefixed by `mx.` |
POSTFIX_MYDESTINATION | comma-separated list of destinations to be delivered locally |
POSTFIX_VIRTUAL_ALIAS_DOMAINS | space-separated list of acceptable domains to relay emails for |
NOMAD_PORT_smtp | mapped port provided by nomad | **Nomad will assign this for you when correctly configured**. It will use the default smtp port if not provided by Nomad.
