
# Build
```shell
apt-get update
apt-get install -y \
  asciidoc \
  autoconf \
  build-essential \
  cmake \
  curl \
  git \
  libglib2.0-dev \
  libtool \
  re2c
git clone --depth=1 https://github.com/tzik/toolchain.git
cd toolchain
./bin/submodule-checkout
./bin/doit
```

# Update
```shell
git pull --ff-only origin
./bin/submodule-checkout
./bin/doit
```

Update to ToTs.
```shell
./bin/clobber
./bin/sync
./bin/doit
```

# Set up
On bash:
```shell
PATH=$(realpath ./out/usr/bin):$PATH
```

On zsh:
```shell
declare -Uxa path
source env.sh
```

# Compile
```shell
cc foo.c
c++ foo.cc
```
