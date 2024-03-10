execute 'curl -fsSL https://bun.sh/install | bash' do
  not_if 'which bun'
end
