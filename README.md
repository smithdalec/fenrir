# Fenrir
Vagrant box for MEAN-stack development

## Initial setup
```bash
cd path/to/fenrir
librarian-puppet install
vagrant up --provision
```

Put any apps in the `apps` directory on the host machine. They'll be mapped to the `/vagrant/apps` directory in the vm.
