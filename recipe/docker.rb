execute 'install docker prerequisites' do
  command "apt install -y ca-certificates gnupg"
end

directory '/etc/apt/keyrings' do
  owner 'root'
  group 'root'
  mode '755'
end

execute 'install docker gpg key' do
  command 'curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg'
  not_if 'test -e /etc/apt/keyrings/docker.gpg'
end

file '/etc/apt/keyrings/docker.gpg' do
  action :edit
  mode '644'
end

arch = `dpkg --print-architecture`.chomp
codename = `. /etc/os-release && echo "$VERSION_CODENAME"`.chomp

file '/etc/apt/sources.list.d/docker.list' do
  owner 'root'
  group 'root'
  mode '644'
  content "deb [arch=#{arch} signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu #{codename} stable"
end


execute 'install docker' do
  command "apt-get update && apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin"
  not_if 'dpkg -l docker-ce > /dev/null'
end
