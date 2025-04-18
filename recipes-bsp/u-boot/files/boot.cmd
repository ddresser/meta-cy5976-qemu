# Initalize TPM
tpm2 init
tpm2 startup TPM2_SU_CLEAR
tpm2 self_test full
# Set boot arguments for the kernel
setenv bootargs root=/dev/vda2 console=ttyAMA0
# Load kernel image
setenv loadaddr 0x40200000
fatload virtio 0:1 ${loadaddr} zImage
# Load device tree binary
setenv loadaddr_dtb 0x49000000
fatload virtio 0:1 ${loadaddr_dtb} qemu.dtb
# save the environment
saveenv
# Boot the kernel
bootz ${loadaddr} - ${loadaddr_dtb}
