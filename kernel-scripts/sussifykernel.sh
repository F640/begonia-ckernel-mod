#!/bin/sh

set -e
export DEFCONFIG="$PWD/arch/arm64/configs/begonia_user_defconfig"

# make it SUS ඞ
sed -ri 's/^(CONFIG_KSU_SUSFS=.*|# CONFIG_KSU_SUSFS is not set)/CONFIG_KSU_SUSFS=y/' $DEFCONFIG
sed -ri 's/^(CONFIG_KSU_SUSFS_SUS_SU=.*|# CONFIG_KSU_SUSFS_SUS_SU is not set)/CONFIG_KSU_SUSFS_SUS_SU=n/' $DEFCONFIG
