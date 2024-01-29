include_recipe 'recipe/docker'

snap 'nvim' do
  classic true
end

package 'gcc'
