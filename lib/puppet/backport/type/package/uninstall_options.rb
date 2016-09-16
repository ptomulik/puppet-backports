require 'puppet/backport/parameter/package_options'

package = Puppet::Type.type(:package)

unless package.features.include? :uninstall_options
  package.feature :uninstall_options, "The provider accepts options to be
      passed to the uninstaller command."

  package.newparam(:uninstall_options, :parent => Puppet::Parameter::PackageOptions, :required_features => :uninstall_options) do
    desc <<-EOT
      An array of additional options to pass when uninstalling a package. These
      options are package-specific, and should be documented by the software
      vendor.  For example:

          package { 'VMware Tools':
            ensure            => absent,
            uninstall_options => [ { 'REMOVE' => 'Sync,VSS' } ],
          }

      Each option in the array can either be a string or a hash, where each
      key and value pair are interpreted in a provider specific way.  Each
      option will automatically be quoted when passed to the uninstall
      command.

      On Windows, this is the **only** place in Puppet where backslash
      separators should be used.  Note that backslashes in double-quoted
      strings _must_ be double-escaped and backslashes in single-quoted
      strings _may_ be double-escaped.
    EOT
  end
end
