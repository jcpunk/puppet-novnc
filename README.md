# novnc

## Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with novnc](#setup)
    * [What novnc affects](#what-novnc-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with novnc](#beginning-with-novnc)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Install and setup noVNC along with websockify.

## Setup

### What novnc affects

This will will try to setup the non-webserver parts of a noVNC site.


### Setup Requirements **OPTIONAL**

You are expected to setup the actual VNC server yourself.

### Beginning with novnc

## Usage


```puppet
class { 'novnc': }
```

The noVNC client takes a parameter `vnc_sessions` with a format of:
```yaml
novnc::vnc_servers:
  session_name: server:port
  other_session_name: server:otherport
```

## Limitations

You must manage you own firewall settings.

There are too may ways folks may want to setup the webserver, so no attempt
is made here to provide hooks for the websockets proxy via `httpd` or `nginx`.

If you want to use the SSL wrapper for `websockify` you are responsible to
depoy the cert, key, CA, and set the parameters you need.

## Development

See the linked repo in `metadata.json`

[1]: https://puppet.com/docs/pdk/latest/pdk_generating_modules.html
[2]: https://puppet.com/docs/puppet/latest/puppet_strings.html
[3]: https://puppet.com/docs/puppet/latest/puppet_strings_style.html
