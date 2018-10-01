Role Name
=========
[![Build Status](https://travis-ci.org/matic-insurance/ansible-docker-mongodb.svg?branch=master)](https://travis-ci.org/matic-insurance/ansible-docker-mongodb)

Ansible role to manage and run the PostreSQL docker container. It optionally creates initial user and database.

It uses data container for persistence, which is more elegant way comparing to host volumes.


Requirements
------------

Ubuntu 14.04 and 16.04 is tested.

This role uses Ansible's docker module, so requirements are [the same](https://docs.ansible.com/ansible/docker_image_module.html#requirements-on-host-that-executes-module).

Role Variables
--------------

Here is the list of default variables with default values:

```yaml
mongodb_container_name: 'mongodb'
mongodb_port: 27017
```

This will run mongo container without authentication and expose 27017 port.
 
Authenticaiton is controlled with these settings

```yaml
# Enable authentication
mongodb_auth: false

# Admin credentials
mongodb_admin_user:
mongodb_admin_password:

# User database
mongodb_db:
# User credentials
mongodb_user:
mongodb_password:
```

Docker memory tuning can be done with this variables
```yaml
container_memory_limit: 512m
```

Mongo docker image and tag:
```yaml
mongodb_docker_image: mongo
mongodb_docker_image_tag: 4
```

For more settings look into [defaults/main.yml](defaults/main.yml)

Dependencies
------------

No dependencies

Example Playbook
----------------

    - hosts: database
      roles:
        - role: matic-insurance.mongodb_container
          tags: ['database]
          mongodb_container_name: 'mongodb'
          mongodb_port: 27017

License
-------

MIT

Author Information
------------------

Matic is a communication platform that connects lenders and borrowers originating a new home loan. A borrower now knows where they are in the loan process and what they need to do to complete the loan.
