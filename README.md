# Playbooks
## Run playbook to localhost
```bash
 ansible-playbook -i host -l local playbooks/docker.yml --ask-become
```

## Run playbook to localhost
```bash
ansible-playbook -i localhost:2222, playbooks/secure-vps.yml -u ubuntu --ask-become 
```

## Run playbook to localhost
```bash
 ansible-playbook -i localhost:2223, playbooks/secure-vps.yml -u root -k 
 ```

# Ansible AWX
## How to install
```
git clone -b 22.3.0 https://github.com/ansible/awx.git
cd awx
make docker-compose-build
make docker-compose
```

The Ansible AWX Web-UI is available at the URL https://localhost:8043/.


