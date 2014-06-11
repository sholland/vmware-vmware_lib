# Copyright (C) 2013 VMware, Inc.
Puppet::Type.newtype(:remote_command) do
  @doc = "Execute a remote command"

  newparam(:name, :namevar => true) do
    desc "The name of the remote_command."
  end

  newproperty(:command) do
  end

  #newparam(:options) do
  #  validate do |value|
  #    fail("Option value must be a hash.") unless value.is_a? ::Hash
  #  end
  #  defaultto({})
  #end

end
