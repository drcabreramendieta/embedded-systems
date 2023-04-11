# Configuración de red entre el sistema embebido y el host de desarrollo

Modificación y ejecución de scripts de configuración de red:
1. Modificar los scripts **setup.sh** y **clean.sh** del directorio **network_qemu** acorde a sus requisitos de red.
2. Ejecutar el script **setup.sh**:
```
$ cd ~
$ sudo ./embedded-systems/network_qemu/setup.sh
```

Ejecución de qemu:
```
$ cd sistemas_embebidos/
sistemas_embebidos$ qemu-system-arm -M vexpress-a9 -kernel kernel/arch/arm/boot/zImage -sd buildroot-2022.11.2/output/images/rootfs.ext4 -dtb kernel/arch/arm/boot/dts/vexpress-v2p-ca9.dtb -append "root=/dev/mmcblk0" -net nic -net tap,ifname=tap0,script=no,downscript=no

```

IP estática para el sistema embebido:
```
# ip addr add 172.28.127.133/20 dev eth0
# ip link set eth0 down
# ip link set eth0 up
```

Conexión por SSH:

Modificar el archivo **/etc/ssh/sshd_config**
```
# vi /etc/ssh/sshd_config
```
y dejarlo con las configuraciones
```
PermitRootLogin yes
PasswordAuthentication yes
PermitEmptyPasswords yes
```
reiniciar el demonio de SSH con
```
# /etc/init.d/S50sshd restart
```
Desde el host se puede ejecutar en un terminal
```
$ ssh root@172.28.127.133
```
con lo que debería conectarse de forma remota al sistema embebido


Para cambios permanentes de IP en el sistema embebido ejecutar:
```
# vi /etc/network/interfaces
```
y escribir (NO COPIAR) las siguientes líneas:
```
auto eth0
iface eth0 inet static
address 172.28.127.133
netmask 255.255.240.0
```