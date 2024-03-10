execute 'install bun' do
  command 'curl -fsSL https://bun.sh/install | bash'
  not_if 'which bun'
end

execute 'install rustup' do
  command 'curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y'
  not_if 'which rustup'
end
