Initial Setup
=============

All the action here are executed as root. For this purpose try this:

```bash
$ sudo su
```

In order to provision, we had to generate our ssh keys first. Therefore,
to generate a ssh key copy and paste the text below, substitute your email.

```bash
$ ssh-keygen -t rsa -C "your_email@example.com"
```
Next, you'll be asked to enter a passphrase (keychaing will do it for you later):

```bash
Enter passphrase (empty for no passphrase): [Type a passphrase]
Enter same passphrase again: [Type passphrase again]
```

Then copy your SSH key and put into your remote repository for SSH deployment.

```bash
$ cat ~/.ssh/id_rsa.pub
```

This procedure is executed just once.

---

Provisioning with Ansible into a Virtual Machine (VM) using vagrant:
====================================================================

```bash
# Bringing VM 'default' up with 'virtualbox' provider
$ vagrant up
# Provision VM with ansible
$ vagrant provision
```

Provisioning into a VPS:

```bash
$ ansible-playbook site.yml
```

More info:

+ [Ansible DOC](http://docs.ansible.com/guide_vagrant.html)
+ [Vagran DOC](http://docs.vagrantup.com/v2/provisioning/ansible.html)


Running a Django Project
========================

Guest machine (vagrant)

```bash
$ python manage.py runserver 0.0.0.0:8000
$ python manage.py runserver 192.168.111.222:8000
```

To check in the browser's host machine:

```bash
192.168.111.222
```
---
