# Various non-script Chef helpers

## Example User knife.rb
```
knife[:editor] = 'vim'
CURRENT_DIR = File.dirname(__FILE__)
node_name 'ben'
client_key 'ben.pem'
validation_client_name 'bens-org-validator.pem'
validation_key '~/bens-org-validator.pem'
chef_server_url 'https://chefurl.com/organizations/bens-org'
cookbook_path ["#{CURRENT_DIR}/../cookbooks"]
cookbook_copyright 'my company'
cookbook_license 'none'
cookbook_email 'team email'
```

## Example Pivotal knife.rb
```
CURRENT_DIR = File.dirname(__FILE__)
ORG = 'some_org'
node_name 'pivotal'
client_key "#{CURRENT_DIR}/pivotal.pem"
chef_server_url "https://chefurl.com/organizations/#{ORG}"
chef_server_root 'https://chefurl.com/'
```

## Add user to org as admin
```
knife opc org user add org user -a
```

## Configuring multiple chefdk's
```
# MacOS installer doesn't allow custom install path
sudo mv /chefdk_path /chefdk_path_1.0.0
# Install new version into /chefdk_path
# Link to desired version
sudo ln -s /chefdk_path_new /chefdk_path
```
