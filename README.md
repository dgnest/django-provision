Provisioning with Ansible into a Vagrant VM
===========================================

Provisioning into vagrant:

```bash
$ vagrant up
$ vagrant provision
```

Provisioning into a VPS:

```bash
$ ansible-playbook site.yml
```

More info:

+ [Ansible DOC](http://docs.ansible.com/guide_vagrant.html)
+  [Vagran DOC](http://docs.vagrantup.com/v2/provisioning/ansible.html)


Running a Django Project
========================

Guest machine (vagrant)

```bash
$ python manage.py runserver 0.0.0.0:8000
$ python manage.py runserver 192.168.33.10:8000
```

To check in the browser's host machine:

```bash
192.168.33.10:8000
```
---
