execute 'install bun' do
  command 'curl -fsSL https://bun.sh/install | bash'
  not_if 'which bun'
end
