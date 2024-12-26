# @api private
# 
# @summary Install the novnc packages
#
# @param manage_packages
#   Should this class manage the packages
# @param packages
#   List of packages to install
# @param packages_ensure
#   Ensure state of the vnc server packages
class novnc::install (
  # lint:ignore:parameter_types
  $manage_packages = $novnc::manage_packages,
  $packages = $novnc::packages,
  $packages_ensure = $novnc::packages_ensure,
  # lint:endignore
) inherits novnc {
  assert_private()

  if $manage_packages {
    stdlib::ensure_packages($packages, { 'ensure' => $packages_ensure })
  }
}
