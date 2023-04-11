# Compilación del sistema de archivos raíz
Descarga de buildroot:
```
$ cd sistemas_embebidos/
sistemas_embebidos$ wget https://buildroot.org/downloads/buildroot-2022.11.2.tar.gz
sistemas_embebidos$ tar xvzf buildroot-2022.11.2.tar.gz
sistemas_embebidos$ cd buildroot-2022.11.2/
```

Configuración de buildroot:
```
buildroot-2022.11.2$ make menuconfig
```
Se debe seleccionar las configuraciones acorde al hardware embebido que se está usando y el software que se desee incrustar.

Compilación de buildroot:
```
buildroot-2022.11.2$ sudo make -j4
```

Permisos de escritura al disco duro:
```
buildroot-2022.11.2$ sudo chmod 777 output/images/rootfs.ext4
```

Ejecución:
```
buildroot-2022.11.2$ cd ..
$ qemu-system-arm -M vexpress-a9 -kernel kernel/arch/arm/boot/zImage -sd buildroot-2022.11.2/output/images/rootfs.ext4 -dtb kernel/arch/arm/boot/dts/vexpress-v2p-ca9.dtb -append "root=/dev/mmcblk0"
```