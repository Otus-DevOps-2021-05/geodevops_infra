# geodevops_infra
geodevops Infra repository

ВЫПОЛНЕНО ДЗ №3 Задача: Исследовать способ подключения к someinternalhost в одну команду из вашего рабочего устройства, проверить работоспособность найденного решения и внести его в README.md в вашем репозитории
Решение:

bastion_IP=130.193.50.148
someinternalhost_IP=10.129.0.26
ssh -J root@$bastion_IP root@$someinternalhost_IP

Задача: Предложить вариант решения для подключения из консоли при помощи команды вида ssh someinternalhost из локальной консоли рабочего устройства, чтобы подключение выполнялось по алиасу someinternalhost и внести его в README.md в вашем репозитории

Решение:
Создать файл ~/.ssh/config и прописать следующее

Host someinternalhost
HostName 10.129.0.26
User appuser
ProxyCommand ssh -A appuser@bastion nc %h %p

Host bastion
HostName 130.193.50.148
User appuser

ВЫПОЛНЕНО ДЗ №4

testapp_IP = 178.154.226.235
testapp_port = 9292
