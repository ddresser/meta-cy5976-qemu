This is a custom Yocto layer for a school project to learn about TPM and other security modules.

My TPM investigations used these excellent resources as a starting point:

Yocto Emulation: Setting Up QEMU with U-Boot

https://ejaaskel.dev/yocto-emulation-setting-up-qemu-with-u-boot/

Yocto Emulation: Setting Up QEMU with TPM

https://ejaaskel.dev/yocto-emulation-setting-up-qemu-with-tpm/

I recommend those instructions and this ebook if you are looking to learn about TPM.

A Practical Guide to TPM 2.0

https://link.springer.com/content/pdf/10.1007/978-1-4302-6584-9.pdf


I have added a recipe to deploy the generated device tree and to compile and deploy a u-boot script to simplify enabling the TPM at boot time.

