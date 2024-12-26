FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
LICENSE = "CLOSED"
DEPENDS += "u-boot-mkimage-native"
inherit deploy

BOOTSCRIPT = "${THISDIR}/boot.cmd"
BINSCRIPT = "boot.scr"

FILES_${PN} += "boot.scr"

do_mkimage () {
    uboot-mkimage -A arm -O linux -T script -C none -a 0 -e 0 \
        -n "boot script" -d ${BOOTSCRIPT} ${S}/${BINSCRIPT}
}
addtask mkimage after do_compile before do_install

do_install () {
    install -D -m 644 ${S}/${BINSCRIPT} ${D}/${BINSCRIPT}
}
do_deploy () {
    install -D -m 644 ${D}/${BINSCRIPT} ${DEPLOYDIR}/${BINSCRIPT}-${MACHINE}-${PV}-${PR}
}
