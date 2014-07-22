About
=====

This repo is an [in-house project](http://dgnest.com) made with ♥ that tries to make our live easier. You don't know how much time we wasted doing this stuff by hand few years ago. So, be patient, we are still working on it.

Features:

+ Deployment server: **Ubuntu 12.04 LTS**


Getting started
===============

In order to provision. First we have to [generate our ssh keys.](https://help.github.com/articles/generating-ssh-keys)
Then copy your SSH public key and put into your remote repository for SSH deployment. 
I forgot, we will use [SSH agent forwarding](https://developer.github.com/guides/managing-deploy-keys/#ssh-agent-forwarding) strategy to deploy our keys.

```bash
$ cat ~/.ssh/id_rsa.pub
```

This procedure is executed just once.



Prepare the Nest
================

Set your local environment with the variables below. I strongly recommend 
to use [virtualenvwrapper](http://virtualenvwrapper.readthedocs.org/en/latest/) 
for this purpose. I am using it and all my virtualenv variables are set into 
the *postactivate* script.

```bash
# Linux User.
export USER=mynewuser
...
```
Check [this](http://docs.ansible.com/faq.html#how-do-i-generate-crypted-passwords-for-the-user-module) out in order to generate user passwords.

```bash
...
export PASSWORD='$6$rounds=100000$.8vhLbNWv7YaHkVb$ALN9H7/4qzVPO83eT1tiT5o4EI9EpBuOo6B53JYcDEXU5Tn2ZMbdlxOCkCaHDnDeJenURpZaX5L3GGlW03s/d1'
export ROOT_PASSWORD='$6$rounds=100000$.8vhLbNWv7YaHkVb$ALN9H7/4qzVPO83eT1tiT5o4EI9EpBuOo6B53JYcDEXU5Tn2ZMbdlxOCkCaHDnDeJenURpZaX5L3GGlW03s/d1'

# Api keys local filepath.
export API_KEY_LOCALPATH='~/projects/django-provision/provisioning/config_keys'
# RSA keys for SSH authentication.
export RSA_PUB_KEY_LOCALPATH='~/.ssh/id_rsa.pub'
export RSA_PRIV_KEY_LOCALPATH='~/.ssh/id_rsa'

# Postgres rol.
export POSTGRES_ROLE=mynewrol
...
```

Check [this](http://docs.ansible.com/postgresql_user_module.html) out to generate encrypted passwords.

```bash
...
export POSTGRES_ROLE_PASSWORD=mypassword
# Postgres database.
export DB_NAME=mydb
export DB_HOST=localhost
export DB_PORT=5432

# Git Repo.
export REPOSITORY="git@remote-host.com:username/myrepo.git"
export REPOSITORY_NAME="myrepo"
export DEPLOYMENT_BRANCH="master"
export REMOTE_HOST="remote-host.com"
```

All these enviroment variables are mapped into the file 
*provisioning/group_vars/all*. So you are free to modify it. 


Provisioning with Ansible into a Virtual Machine (VM) using vagrant:
====================================================================

```bash
# Bringing VM 'default' up with 'virtualbox' provider.
$ vagrant up
# Provision our VM with ansible.
$ vagrant provision
```

More info:

+ [Ansible DOC](http://docs.ansible.com/guide_vagrant.html)
+ [Vagran DOC](http://docs.vagrantup.com/v2/provisioning/ansible.html)

Provisioning with Ansible into a VPS:
=====================================

Before this step, you need to [set your inventory](http://docs.ansible.com/intro_inventory.html). 
Then, go inside the directory named **provisioning** and 
*let the hacking begin* with this command.

```bash
$ ansible-playbook -vvvv -u remote_user_name --sudo site.yml
# Examples:
$ ansible-playbook -vvvv -u root --sudo site.yml
$ ansible-playbook -vvvv -u dgnest --sudo site.yml
```

Running our Django Project
=========================

Inside out guest machine (vagrant) run *su newuser* to login as our
deployment user (newuser). Finally enter to the virtualenv and run the basics.

```bash
$ cd ~ && source venv/bin/activate
# Go inside your repo.
$ python manage.py runserver localhost:9000
```

To check in the browser's host machine:

```bash
192.168.33.10
```
---
