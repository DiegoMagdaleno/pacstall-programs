name="pipewire"
version="0.3.60"
build_depends="meson libdbus-1-dev debhelper-compat findutils libasound2-dev libavcodec-dev libavfilter-dev libavformat-dev libdbus-1-dev libglib2.0-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libsbc-dev libsdl2-dev libudev-dev libva-dev libv4l-dev libx11-dev ninja-build pkg-config python3-docutils python3-pip"
url="https://gitlab.freedesktop.org/${name}/${name}/-/archive/${version}/${name}-${version}.zip"
maintainer="Henryws <hwengerstickel@pm.me>"
description="Server and user space API to deal with multimedia pipelines"
hash="a356b195bc7dc98c6a443ede2a31dc8ba56ffa58481425f49706c0cbeea12081"
prepare() {
    meson setup builddir
}

build() {
    meson configure builddir -Dprefix=/usr
    ninja -C builddir
}

install() {
    cd builddir/
    sudo DESTDIR="${pkgdir}" meson install
}
