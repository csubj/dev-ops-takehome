workspace(name = "ergatta-source")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

## basics 

http_archive(
    name = "rules_proto",
    sha256 = "80d3a4ec17354cccc898bfe32118edd934f851b03029d63ef3fc7c8663a7415c",
    strip_prefix = "rules_proto-5.3.0-21.5",
    urls = [
        "https://github.com/bazelbuild/rules_proto/archive/refs/tags/5.3.0-21.5.tar.gz",
    ],
)

load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")
rules_proto_dependencies()
rules_proto_toolchains()

http_archive(
    name = "com_google_protobuf",
    sha256 = "bc3dbf1f09dba1b2eb3f2f70352ee97b9049066c9040ce0c9b67fb3294e91e4b",
    strip_prefix = "protobuf-3.15.5",
    # latest, as of 2021-03-08
    urls = [
        "https://github.com/protocolbuffers/protobuf/archive/v3.15.5.tar.gz",
        "https://mirror.bazel.build/github.com/protocolbuffers/protobuf/archive/v3.15.5.tar.gz",
    ],
)

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

## rules_jvm_external

http_archive(
    name = "rules_jvm_external",
    sha256 = "cd1a77b7b02e8e008439ca76fd34f5b07aecb8c752961f9640dea15e9e5ba1ca",
    strip_prefix = "rules_jvm_external-4.2",
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/4.2.zip",
)

load("@rules_jvm_external//:defs.bzl", "maven_install")

maven_install(
    name = "maven",
    artifacts = [
        "org.robolectric:robolectric:4.9",
        "junit:junit:4.13.2",
        "com.google.truth:truth:1.1.3",
        "androidx.core:core-ktx:1.7.0",
        "org.jetbrains.kotlin:kotlin-stdlib-common:1.7.10",
        "org.jetbrains.kotlin:kotlin-stdlib-jdk7:1.7.10",
        "org.jetbrains.kotlin:kotlin-stdlib-jdk8:1.7.10",
        "org.jetbrains.kotlin:kotlin-stdlib:1.7.10",
        "androidx.appcompat:appcompat:1.4.1",
        'com.google.android.material:material:1.5.0',
        "org.jetbrains.kotlin:kotlin-serialization:1.7.10",
        'junit:junit:4.13.2',
        'androidx.test.ext:junit:1.1.3',
        'androidx.test.espresso:espresso-core:3.4.0',
        "androidx.compose.ui:ui-test-junit4:$compose_version",
        "androidx.compose.ui:ui-tooling:$compose_version",
        'androidx.lifecycle:lifecycle-runtime-ktx:2.4.1',
        'androidx.activity:activity-compose:1.4.0',
        "androidx.compose.ui:ui:$compose_version",
        "androidx.compose.material:material:$compose_version",
        "androidx.compose.ui:ui-tooling-preview:$compose_version",
    ],
    repositories = [
        "https://maven.google.com",
        "https://repo1.maven.org/maven2",
    ],
)

## Android

http_archive(
    name = "build_bazel_rules_android",
    sha256 = "cd06d15dd8bb59926e4d65f9003bfc20f9da4b2519985c27e190cddc8b7a7806",
    strip_prefix = "rules_android-0.1.1",
    urls = ["https://github.com/bazelbuild/rules_android/archive/v0.1.1.zip"],
)

load("@build_bazel_rules_android//android:rules.bzl", "android_sdk_repository")

android_sdk_repository(
    name = "androidsdk",
)

## Kotlin

http_archive(
    name = "io_bazel_rules_kotlin",
    sha256 = "f033fa36f51073eae224f18428d9493966e67c27387728b6be2ebbdae43f140e",
    url = "https://github.com/bazelbuild/rules_kotlin/releases/download/v1.7.0-RC-3/rules_kotlin_release.tgz",
)

load("@io_bazel_rules_kotlin//kotlin:repositories.bzl", "kotlin_repositories")

kotlin_repositories()

load("@io_bazel_rules_kotlin//kotlin:core.bzl", "kt_register_toolchains")

kt_register_toolchains()

# Android Testing

http_archive(
    name = "robolectric",
    sha256 = "7655c49633ec85a18b5a94b1ec36e250671808e45494194959b1d1d7f3e73a23",
    strip_prefix = "robolectric-bazel-4.9",
    urls = ["https://github.com/robolectric/robolectric-bazel/archive/4.9.tar.gz"],
)

load("@robolectric//bazel:robolectric.bzl", "robolectric_repositories")

robolectric_repositories()

# Apple /Swift Install 
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

git_repository(
    name = "build_bazel_rules_ios",
    remote = "https://github.com/bazel-ios/rules_ios.git",
    branch = "master",
)

load(
    "@build_bazel_rules_ios//rules:repositories.bzl",
    "rules_ios_dependencies"
)

rules_ios_dependencies()

load(
    "@build_bazel_rules_apple//apple:repositories.bzl",
    "apple_rules_dependencies",
)
apple_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()

load(
    "@build_bazel_apple_support//lib:repositories.bzl",
    "apple_support_dependencies",
)

apple_support_dependencies()
