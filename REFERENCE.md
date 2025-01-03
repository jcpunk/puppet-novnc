# Reference

<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

### Classes

#### Public Classes

* [`novnc`](#novnc): Setup a websocket service for running the NoVNC interface

#### Private Classes

* `novnc::config`: Setup any token file or webserver index
* `novnc::install`: Install the novnc packages
* `novnc::service`: manage the websockify service

## Classes

### <a name="novnc"></a>`novnc`

Setup a websocket service for running the NoVNC interface

#### Parameters

The following parameters are available in the `novnc` class:

* [`manage_packages`](#-novnc--manage_packages)
* [`packages`](#-novnc--packages)
* [`packages_ensure`](#-novnc--packages_ensure)
* [`manage_service_config`](#-novnc--manage_service_config)
* [`websockify_config_dir`](#-novnc--websockify_config_dir)
* [`websockify_config_mode`](#-novnc--websockify_config_mode)
* [`websockify_token_plugin`](#-novnc--websockify_token_plugin)
* [`websockify_token_source`](#-novnc--websockify_token_source)
* [`websockify_auth_plugin`](#-novnc--websockify_auth_plugin)
* [`websockify_auth_source`](#-novnc--websockify_auth_source)
* [`websockify_service_user`](#-novnc--websockify_service_user)
* [`websockify_service_group`](#-novnc--websockify_service_group)
* [`websockify_service_dynamicuser`](#-novnc--websockify_service_dynamicuser)
* [`make_webserver_vnc_index`](#-novnc--make_webserver_vnc_index)
* [`webserver_novnc_location`](#-novnc--webserver_novnc_location)
* [`webserver_vnc_index`](#-novnc--webserver_vnc_index)
* [`manage_service`](#-novnc--manage_service)
* [`websockify_command`](#-novnc--websockify_command)
* [`websockify_service_name`](#-novnc--websockify_service_name)
* [`websockify_service_ensure`](#-novnc--websockify_service_ensure)
* [`websockify_service_enable`](#-novnc--websockify_service_enable)
* [`websockify_port`](#-novnc--websockify_port)
* [`websockify_webroot`](#-novnc--websockify_webroot)
* [`websockify_prefer_ipv6`](#-novnc--websockify_prefer_ipv6)
* [`websockify_use_ssl`](#-novnc--websockify_use_ssl)
* [`websockify_use_ssl_only`](#-novnc--websockify_use_ssl_only)
* [`websockify_ssl_ca`](#-novnc--websockify_ssl_ca)
* [`websockify_ssl_cert`](#-novnc--websockify_ssl_cert)
* [`websockify_ssl_key`](#-novnc--websockify_ssl_key)
* [`vnc_servers`](#-novnc--vnc_servers)

##### <a name="-novnc--manage_packages"></a>`manage_packages`

Data type: `Boolean`

Should this class manage the packages

##### <a name="-novnc--packages"></a>`packages`

Data type: `Array`

List of packages to install

##### <a name="-novnc--packages_ensure"></a>`packages_ensure`

Data type: `String`

Ensure state of the vnc server packages

##### <a name="-novnc--manage_service_config"></a>`manage_service_config`

Data type: `Boolean`

should this class manage any config files?

##### <a name="-novnc--websockify_config_dir"></a>`websockify_config_dir`

Data type: `Stdlib::Absolutepath`

where are config files kept

##### <a name="-novnc--websockify_config_mode"></a>`websockify_config_mode`

Data type: `String`

what should the config mode be

##### <a name="-novnc--websockify_token_plugin"></a>`websockify_token_plugin`

Data type: `String`

what type of token plugin is in use

##### <a name="-novnc--websockify_token_source"></a>`websockify_token_source`

Data type: `String`

what is the data source for the token plugin
if $websockify_token_plugin == 'TokenFile' or 'ReadOnlyTokenFile', this should be the filename

##### <a name="-novnc--websockify_auth_plugin"></a>`websockify_auth_plugin`

Data type: `String`

what type of auth plugin is in use

##### <a name="-novnc--websockify_auth_source"></a>`websockify_auth_source`

Data type: `String`

what is the data source for the auth plugin

##### <a name="-novnc--websockify_service_user"></a>`websockify_service_user`

Data type: `String`

User to run the service as

##### <a name="-novnc--websockify_service_group"></a>`websockify_service_group`

Data type: `String`

Group to run the service as

##### <a name="-novnc--websockify_service_dynamicuser"></a>`websockify_service_dynamicuser`

Data type: `Boolean`

Use systemd dynamic users for this service

##### <a name="-novnc--make_webserver_vnc_index"></a>`make_webserver_vnc_index`

Data type: `Boolean`

Make a simple index file listing out known sessions

##### <a name="-novnc--webserver_novnc_location"></a>`webserver_novnc_location`

Data type: `Stdlib::Absolutepath`

What is the URL base for novnc (probably /novnc)

##### <a name="-novnc--webserver_vnc_index"></a>`webserver_vnc_index`

Data type: `Stdlib::Absolutepath`

Where should we write out the known session index?

##### <a name="-novnc--manage_service"></a>`manage_service`

Data type: `Boolean`

Should this service be managed

##### <a name="-novnc--websockify_command"></a>`websockify_command`

Data type: `Stdlib::Absolutepath`

where is /usr/bin/websockify?

##### <a name="-novnc--websockify_service_name"></a>`websockify_service_name`

Data type: `String`

Name of service to manage

##### <a name="-novnc--websockify_service_ensure"></a>`websockify_service_ensure`

Data type: `String`

Ensure for service

##### <a name="-novnc--websockify_service_enable"></a>`websockify_service_enable`

Data type: `Boolean`

Enable for service

##### <a name="-novnc--websockify_port"></a>`websockify_port`

Data type: `Variant[String, Integer[0,65535]]`

Port to listen on

##### <a name="-novnc--websockify_webroot"></a>`websockify_webroot`

Data type: `Stdlib::Absolutepath`

Webroot for service to use

##### <a name="-novnc--websockify_prefer_ipv6"></a>`websockify_prefer_ipv6`

Data type: `Boolean`

Try IPv6 before IPv4

##### <a name="-novnc--websockify_use_ssl"></a>`websockify_use_ssl`

Data type: `Boolean`

Use an SSL certificate for websockify

##### <a name="-novnc--websockify_use_ssl_only"></a>`websockify_use_ssl_only`

Data type: `Boolean`

Only use SSL connections

##### <a name="-novnc--websockify_ssl_ca"></a>`websockify_ssl_ca`

Data type: `Stdlib::Absolutepath`

SSL Certificate Authority for websockify

##### <a name="-novnc--websockify_ssl_cert"></a>`websockify_ssl_cert`

Data type: `Stdlib::Absolutepath`

SSL certificate for websockify

##### <a name="-novnc--websockify_ssl_key"></a>`websockify_ssl_key`

Data type: `Stdlib::Absolutepath`

SSL key for websockify

##### <a name="-novnc--vnc_servers"></a>`vnc_servers`

Data type: `Hash`

A hash of VNC servers to connect to.
ie. {'session_name' => 'host:port'}

