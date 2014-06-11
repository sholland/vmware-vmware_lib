require 'pathname'
mod = Puppet::Module.find('vmware_lib', Puppet[:environment].to_s).path rescue Pathname.new(__FILE__).parent.parent.parent.parent.parent
require File.join mod, 'lib/puppet/type/transport'
require File.join mod, 'lib/puppet_x/puppetlabs/transport'
require File.join mod, 'lib/puppet_x/puppetlabs/transport/ssh'

Puppet::Type.type(:remote_command).provide(:ssh) do
  confine :feature => :ssh

  include PuppetX::Puppetlabs::Transport

  def command
    # warning, this command will run over and over, use remote_command_lockfile
    # in different type/provider if that behaviour is desired
    false
  end

  def command=(value)
    run_remote_command(value) 
  end
  
  private

  def run_remote_command(value)
    transport.exec!("#{value}")
  end

end
