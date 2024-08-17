load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "rules_cc",
    sha256 = "2037875b9a4456dce4a79d112a8ae885bbc4aad968e6587dca6e64f3a0900cdf",
    strip_prefix = "rules_cc-0.0.9",
    urls = [
        "https://github.com/bazelbuild/rules_cc/releases/download/0.0.9/rules_cc-0.0.9.tar.gz",
    ],
)

# load rules_nixpkgs
http_archive(
    name = "io_tweag_rules_nixpkgs",
    sha256 = "2a555348d7f8593fca2bf3fc6ce53c5d62929de81b6c292e23f16c557c0ae45a",
    strip_prefix = "rules_nixpkgs-0.11.1",
    urls = ["https://github.com/tweag/rules_nixpkgs/releases/download/v0.11.1/rules_nixpkgs-0.11.1.tar.gz"],
)

# load everything that rules_nixpkgs rules need to work
load("@io_tweag_rules_nixpkgs//nixpkgs:repositories.bzl", "rules_nixpkgs_dependencies")

rules_nixpkgs_dependencies()

load("@io_tweag_rules_nixpkgs//nixpkgs:nixpkgs.bzl", "nixpkgs_cc_configure", "nixpkgs_local_repository", "nixpkgs_package")

nixpkgs_local_repository(
    name = "nixpkgs",
    nix_file = "//:nixpkgs.nix",
    nix_file_deps = ["//:flake.lock"],
)

load("@io_tweag_rules_nixpkgs//nixpkgs:nixpkgs.bzl", "nixpkgs_cc_configure")

# Host Configuration
nixpkgs_cc_configure(
    name = "nixpkgs_config_cc",
    attribute_path = "gcc13",
    nix_file_content = "(import <nixpkgs> {})",
    repository = "@nixpkgs",
)

# Get the arm gcc cross-compiler package
nixpkgs_package(
    name = "arm_none_eabi_cc",
    attribute_path = "gcc-arm-embedded-13",
    nix_file_content = "(import <nixpkgs> {})",
    repository = "@nixpkgs",
)

load("@rules_cc//cc:repositories.bzl", "rules_cc_dependencies", "rules_cc_toolchains")

rules_cc_dependencies()

rules_cc_toolchains()
