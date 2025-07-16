# Warp Container
This repository hosts build files for running [Cloudflare Warp](https://developers.cloudflare.com/cloudflare-one/connections/connect-devices/warp/) in a container.

Normally, Warp would be installed onto user workstations for end users to access Cloudflare protected resources using their Zero Trust platform. However, some use cases may benefit from having Warp as a service for machine to machine communications.

This container is designed for organizations with a Cloudflare Zero Trust account.

## Using
Configuration for Warp is done by manually instrumenting mdm.xml for the Warp client. Environment variables are used to configure the client and set configurations.

- ORGANIZATION: The organization or team name that should be passed to Warp.
- AUTH_CLIENT_ID: The service auth client id to enroll the Warp client.
- AUTH_CLIENT_SECRET: The service auth client secret to enroll the Warp client.
- VNET_ID: (optional) The Id of the virtual network that should be connected to.

For service auth to be configured, a Warp enrollment policy must be present to allow service auth for the configured service account.