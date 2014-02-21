Provisioning
============

Into vagrant:

```bash
$ vagrant provision
```

Into a VPS:

```bash
$ ansible-playbook site.yml
```

Running a Django Project
========================

Guest machine (vagrant)

```bash
$ python manage.py runserver 0.0.0.0:8000
$ python manage.py runserver 192.168.33.10:8000
```

To check in the host machine:

```bash
192.168.33.10:8000
```
---
