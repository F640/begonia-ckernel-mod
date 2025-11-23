#!/bin/bash

set -e
export DEV_DEFCONFIG="$PWD/arch/arm64/configs/begonia_user_defconfig"

# comment means left to config defaults
declare -a add_enable_feature_flags=(
    # KVM
    "CONFIG_VIRTUALIZATION"
    "CONFIG_KVM"

    # VFIO
    "CONFIG_VFIO_CCW"
    "CONFIG_VFIO_AP"
    "CONFIG_VFIO_PCI"
    "CONFIG_VFIO_MDEV"
    "CONFIG_VFIO_MDEV_DEVICE"
    "CONFIG_IOMMU_SUPPORT"
    "CONFIG_S390_CCW_IOMMU"
    "CONFIG_S390_AP_IOMMU"
)

# add and enable features logic
for CONFIG in "${add_enable_feature_flags[@]}"
do
   echo "$CONFIG=y" >> $DEV_DEFCONFIG
done

# enable VFIO
sed -ri "s/^(CONFIG_VFIO=.*|# CONFIG_VFIO is not set)/CONFIG_VFIO=y/" $DEV_DEFCONFIG

# ARM virtualization support
echo "CONFIG_ARM64_VHE=1" >> $DEV_DEFCONFIG
