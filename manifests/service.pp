# @api private
#
# @summary manage the websockify service
#
class novnc::service (
  # lint:ignore:parameter_types
  $manage_service = $novnc::manage_service,
  $websockify_command = $novnc::websockify_command,
  $websockify_service_user = $novnc::websockify_service_user,
  $websockify_service_group = $novnc::websockify_service_group,
  $websockify_service_dynamicuser = $novnc::websockify_service_dynamicuser,
  $websockify_service_name = $novnc::websockify_service_name,
  $websockify_service_ensure = $novnc::websockify_service_ensure,
  $websockify_service_enable = $novnc::websockify_service_enable,
  $websockify_auth_plugin = $novnc::websockify_auth_plugin,
  $websockify_auth_source = $novnc::websockify_auth_source,
  $websockify_token_plugin = $novnc::websockify_token_plugin,
  $websockify_token_source = $novnc::websockify_token_source,
  $websockify_port = $novnc::websockify_port,
  $websockify_webroot = $novnc::websockify_webroot,
  $websockify_prefer_ipv6 = $novnc::websockify_prefer_ipv6,
  $websockify_use_ssl = $novnc::websockify_use_ssl,
  $websockify_use_ssl_only = $novnc::websockify_use_ssl_only,
  $websockify_ssl_ca = $novnc::websockify_ssl_ca,
  $websockify_ssl_cert = $novnc::websockify_ssl_cert,
  $websockify_ssl_key = $novnc::websockify_ssl_key,
  # lint:endignore
) inherits novnc {
  assert_private()

  if $websockify_service_ensure == 'running' {
    $active = true
  } else {
    $active = false
  }

  $template_params = {
    'websockify_command'             => $websockify_command,
    'websockify_service_user'        => $websockify_service_user,
    'websockify_service_group'       => $websockify_service_group,
    'websockify_service_dynamicuser' => $websockify_service_dynamicuser,
    'websockify_auth_plugin'         => $websockify_auth_plugin,
    'websockify_auth_source'         => $websockify_auth_source,
    'websockify_token_plugin'        => $websockify_token_plugin,
    'websockify_token_source'        => $websockify_token_source,
    'websockify_port'                => $websockify_port,
    'websockify_webroot'             => $websockify_webroot,
    'websockify_prefer_ipv6'         => $websockify_prefer_ipv6,
    'websockify_use_ssl'             => $websockify_use_ssl,
    'websockify_use_ssl_only'        => $websockify_use_ssl_only,
    'websockify_ssl_ca'              => $websockify_ssl_ca,
    'websockify_ssl_cert'            => $websockify_ssl_cert,
    'websockify_ssl_key'             => $websockify_ssl_key,
  }

  if $manage_service {
    systemd::unit_file { $websockify_service_name:
      ensure  => 'present',
      enable  => $websockify_service_enable,
      active  => $active,
      content => epp('novnc/usr/lib/systemd/system/websockify.service.epp', $template_params),
    }

    if $websockify_use_ssl {
      Systemd::Unit_file[$websockify_service_name] {
        subscribe => File[$websockify_ssl_cert, $websockify_ssl_key, $websockify_ssl_ca],
      }
    }
  }
}
