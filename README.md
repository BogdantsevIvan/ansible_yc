---

# Подготовка перед запуском

Прежде чем приступить к запуску проекта, необходимо сконфигурировать несколько переменных. Давайте рассмотрим, как это сделать.

## Шаг 1: Скопируйте файлы

Сначала вам необходимо скопировать файлы secret-variables.pkrvars.hcl-example и my-variables.tfvars-example, затем заменить значения в них. Для этого воспользуйтесь следующими командами:

cp terraform/my-variables.tfvars-example terraform/my-variables.tfvars
cp packer/secret-variables.pkrvars.hcl-example packer/secret-variables.pkrvars.hcl

## Шаг 2: Запуск Ansible playbook

После того как переменные сконфигурированы, из корневой директории проекта запустите команду:

ansible-playbook -i /ansible/myhosts.ini my-playbook.yml

---
