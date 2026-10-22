load("@bazel_skylib//rules:common_settings.bzl", "bool_flag")
load(":moto_products.bzl", "define_moto_kernel_internal_headers", "define_moto_product_flag")
load("//vendor/qcom/kernel/arch/arm64/boot/dts/vendor:qcom/platform_map.bzl", _get_dtb_list = "get_dtb_list", _get_dtb_products = "get_dtb_products", _get_dtbo_list = "get_dtbo_list")

def define_top_level_rules():
    define_moto_product_flag()
    define_moto_kernel_internal_headers()

    for skippable in ["abl", "dtc", "abi"]:
        bool_flag(name = "skip_{}".format(skippable), build_setting_default = False)

        native.config_setting(
            name = "skip_{}_setting".format(skippable),
            flag_values = {":skip_{}".format(skippable): "1"},
        )

        native.config_setting(
            name = "include_{}_setting".format(skippable),
            flag_values = {":skip_{}".format(skippable): "0"},
        )

def define_combined_vm_image(target, variant, vm_size_ext4):
    return

def define_extras(target, flavor = None, alias = None):
    return

def get_build_config_fragments(target):
    return []

def get_dtb_list(target, product = None):
    return _get_dtb_list(target, product = product)

def get_dtbo_list(target, product = None):
    return _get_dtbo_list(target, product = product)

def get_dtb_products(target):
    return _get_dtb_products(target)

def get_dtstree(target):
    return "//vendor/qcom/kernel/arch/arm64/boot/dts/vendor:msm_dt"

def get_vendor_ramdisk_binaries(target, flavor = None):
    return None

def get_16K_vendor_ramdisk_binaries(target, flavor = None):
    return None
