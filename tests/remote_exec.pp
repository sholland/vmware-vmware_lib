transport { 'ssh':
  username => bob,
  password => test,
  server   => '192.168.1.10',
  # for hosts that keep getting re-deployed over and over again
  options  => { 'user_known_hosts_file' => '/dev/null' },
}

remote_command { test:
  command => 'echo test > /tmp/test',
  transport => Transport['ssh'],
  provider  => ssh,
}
