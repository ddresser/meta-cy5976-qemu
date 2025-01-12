FILESEXTRAPATHS:prepend := "${THISDIR}/files:${THISDIR}/files/configs:"
LICENSE = "CLOSED"
DEPENDS += "u-boot-mkimage-native"
inherit deploy

SRC_URI += "file://boot.cmd \
	    file://uEnv.txt \
	    file://qemu_arm_defconfig;subdir=git/configs/ \
	    "
	    
UBOOT_ENV = "boot"
UBOOT_ENV_SUFFIX = "scr"
#UBOOT_CONFIG += " CONFIG_SECURE_BOOT=y"
UBOOT_ENVIRONMENT = "uEnv.txt"

do_compile:prepend() {
    cp ${WORKDIR}/uEnv.txt ${S}/
}

# Install boot.scr to the image if it was generated
do_install:append () {
    if [ -f ${WORKDIR}/boot.scr ]; then
        echo "Installing boot.scr in root filesystem"
        install -d ${D}/boot
        install -m 0644 ${WORKDIR}/boot.scr ${D}/boot/
    else
	echo "ERROR: boot.scr not found!"
    fi
}

# Deploy boot.scr to the deploy directory
do_deploy:append () {
    if [ -f ${WORKDIR}/boot.scr ]; then
        install -m 0644 ${WORKDIR}/boot.scr ${DEPLOYDIR}/
        install -m 0644 ${WORKDIR}/uEnv.txt ${DEPLOYDIR}/	
    fi
}
