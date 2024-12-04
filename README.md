# hrbOS
This project aims to create a customized Operating system to run my containerized applications (docker and docker-compose)

## Final Goal
Creates a bootable pen drive to install my hrb customized operational system.
The OS should offer a robust environment for workloads based on docker containers.
It should have a portainer container pre-installed and running. Portainer will manage simple containerized apps 
and should be the single way to access SO graphically.

 
The first attempt using Elemental project discribed in [ai-dialogs.md](.docs/ai-dialogs.md) doesn't work yet.
The elemental command line is launching errors when executing elemental create-iso .....

A second attempt will try using k3os approach. ...

This project isn't a priority, since it is possible to create the same environment using Debian/Ubuntu with docker installed.
