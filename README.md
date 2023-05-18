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
