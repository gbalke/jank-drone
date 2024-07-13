load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")


def rpi_bazel_repository(name):
    commit = "434d7adf239c3b4ea1eaa4b687ea90e58e302cfc"
    http_archive(
        name = name,
        url = "https://github.com/mjbots/rpi_bazel/archive/{}.zip".format(commit),
        sha256 = "d9c95ea4749b2c3217d9d53ef17f18ccf3d9237977162f715dff8bfe2fc86a65",
        strip_prefix = "rpi_bazel-{}".format(commit),
    )

