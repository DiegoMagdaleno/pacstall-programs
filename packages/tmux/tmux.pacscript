name="tmux"
version="3.3"
url="https://github.com/tmux/tmux/releases/download/${version}/tmux-${version}.tar.gz"
build_depends="gcc make pkg-config bison"
depends="libncurses-dev libevent-dev"
breaks="${name}-git ${name}-bin ${name}-deb ${name}-app"
replace="tmux"
description="A terminal multiplexer"
hash="b2382ac391f6a1c5b93293016cdc9488337d9a04b9d611ae05eac164740351dc"
optdepends=("libutempter-dev: Record user sessions to utmp and wtmp files")
maintainer="Harshwardhan Mehrotra <abrakadabra18262@protonmail.com>"
prepare() {
	true
}
build() {
        # Check if `libutempter-dev` ( optdepends ) is installed
        if dpkg-query -W libutempter-dev > /dev/null 2>&1; then
                ./configure --enable-utempter
  else
                ./configure
  fi
        make -j$(nproc)
}
install() {
          sudo make install DESTDIR="$STOWDIR/$name"
          sudo install -Dm755 example_tmux.conf "$STOWDIR/$name/usr/share/tmux/example_tmux.conf"
          sudo install -Dm0644 COPYING "$STOWDIR/$name/usr/share/licenses/tmux/LICENSE"

}
