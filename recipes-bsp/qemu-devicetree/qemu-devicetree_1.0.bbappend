SUMMARY = "QEMU device tree binary"
DESCRIPTION = "Recipe deploying the generated QEMU device tree binary blob"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://qemu.dtb"

inherit deploy

do_deploy() {
    install -d ${DEPLOYDIR}
    install -m 0664 ${WORKDIR}/qemu.dtb ${DEPLOYDIR}/
    install -m 0664 ${WORKDIR}/qemu.dtb ${DEPLOYDIR}/u-boot-qemuarm-uboot-2024.01-r0.dtb
}

addtask do_deploy after do_compile before do_build
