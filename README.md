# Prerequisites 

On the Blessed path:
1. install docker via https://www.docker.com/
1. run `./build.sh`
1. build targets like: `bazel build Android/app/src/main/


No bells and whistles: 
1. install bazel for your platform 
1. install AndroidSDK
1. install Swift Xcode for your environment (hopefully you're on a mac)
1. bazel build <TARGET>

# How the Sausage is made

## High-level 
General structure is this: I'm using Docker containers to establish the dev environment, this environment has the Android SDK and Apple Swift developer tools installed. We copy our various resources into this container and mount the directory when we run the image in interactive mode.

Now we have a method to build our binaries in a platform and environment agnostic style which is great for a consistent and automated CI/CD.

## Room for improvement
For actually writing and developing code, developers might have some extra steps depending on how they want to work. We can try forcing our devs to build and test from the docker-interactive cmdline so their toolchain matches the production toolchain. Alternatively we can have maintain their own developer environment and try keeping it in sync. 

This is not the best possible form for a enterprise environment, an improvement for any developer workflow would be to provide a managed and consistent environment across all developers and control the versioning of package

- Ensure compatiablity with different architectures (currently pinned to my mac m1pro/arm64)
- Clean up image build; installs probably too many deps and could be much leaner. 
- Commit Image with resources already pre-installed for devs to have so that on rebuild that we dont always rebuild from scratch
- Push image to private company image repo 
- Setup the bazel build farm for improved build times and build caching 
- Figure out all the various warnings :/ 
- Fix builds entirely. woof. 
- Migrate to per-lib BUILD file, instead of per-project. This will give more granularity around targets and importing code across a monorepo 
- Clean up workspace file
- Improve Dockerfile definition, probably do a bit less copy paste. 