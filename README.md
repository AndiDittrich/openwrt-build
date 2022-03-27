OpenWRT encapsulated build environment
========================================

build openwrt firmware images within podman container. based on debian bullseye

some specific build configurations are available in `/home/build/conf`

Current Snapshot
-------------------

* Tag: `v18.06.4`
* Tag: `v19.07.4`
* Tag: `v21.02.2`

Usage
-------------------

### Step 1 - Build container image ###

```bash
# build container image using specific openwrt tag/branch
# the tag/branch name is also used as container image tag
# this will automatically checkout the git tag/branch and download the related feeds
./openwrtbuild init v21.02.2
```

### Step 2 - Setup build configuration and run make ###

Note: building the specific toolchain will initially take some time depending on your cpu resources (+20min)

**Example - Custom Build**

```bash
# set target device
make menuconfig

# set defaults
make defconfig

# change config
make menuconfig

# fetch packages
make download

# build (n+1 core)
make -j5
```

**Example - Load preconfiguration file**

```bash
# copy diffconfig
cp ../conf/v19/wrtac.conf .config

# expand diffconfig
make defconfig

# fetch packages
make download

# build (n+1 core)
make -j5
```

### Step 3 - Firnware Images ###

The firmware images are stored within the directory `target/` of your current working dir via bind-mount (container `/home/build/openwrt/bin/targets/<device>/<arch>`).

References/Docs
-------------------

* [Quick Image Building Guide](https://openwrt.org/docs/guide-developer/quickstart-build-images) | openwrt.org
* [Build system Usage](https://openwrt.org/docs/guide-developer/build-system/use-buildsystem) | openwrt.org


Device References 
-------------------

* [Linksys WRTxxxAC Series](https://openwrt.org/toh/linksys/wrt_ac_series)

Configuration Templats
-------------------

A few configuration templates are available in [conf/](conf/)

Save Custom Configurations
----------------------------

You can dump your config changes by using he `scripts/diffconfig.sh` script

**Example**

```bash
./scripts/diffconfig.sh > myconfig
```


Prebuild Images
------------------------------

Some prebuild images (from configuration templates) are available on http://dl.a3non.org/openwrt/

License
------------------------------
The Dockerfile and configuration templates are OpenSource and licensed under the Terms of [Mozilla Public License 2.0](https://opensource.org/licenses/MPL-2.0) - your're welcome to contribute