load("@bazel_skylib//rules:build_test.bzl", "build_test")
load(
    "@build_bazel_rules_apple//apple:ios.bzl",
    "ios_application",
    "ios_extension",
    "ios_static_framework",
    "ios_ui_test",
    "ios_unit_test",
)
load(
    "@build_bazel_rules_swift//swift:swift.bzl",
    "swift_library",
)

licenses(["notice"])


swift_library(
    name = "SwordleLib",
    srcs = ["Swordle/**/*.swift"],
    module_name = "Swordle",
)

swift_library(
    name = "SwordleTests",
    srcs = ["SwordleTests/**/*.swift"],
    module_name = "SwordleTests",
)

swift_library(
    name = "SwordleUITests",
    srcs = ["SwordleUITests/**/*.swift"],
    module_name = "SwordleUITests",
)

# packaging 

ios_application(
    name = "Swordle",
    bundle_id = "com.ergatta.Swordle",
    families = [
        "iphone",
        "ipad",
    ],
    infoplists = [],
    minimum_os_version = "8.0",
    deps = [
        ":SwordleLib",
    ],
)

# testing 

ios_unit_test(
    name = "iOSSwordleTests",
    minimum_os_version = "9.0",
    test_host = ":Swordle",
    deps = [":SwordleTests"],
)

ios_ui_test(
    name = "iOSSwordleUITests",
    minimum_os_version = "9.0",
    test_host = ":Swordle",
    deps = [":SwordleUITests"],
)

test_suite(
    name = "iOSSwordleTestSuite",
    tests = [
        ":SwordleTests",
        ":SwordleUITests",
    ],
)
