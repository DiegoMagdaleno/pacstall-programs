name="rhino-linux-xfce4-config"
maintainer="cat-master21 <96554164+cat-master21@users.noreply.github.com>"
description="Rhino Linux XFCE4 configuration."
breaks="${pkgname}-bin ${pkgname}-git"
optdepends=("xfce4: To use the configuration")

pkgver() {
  curl -s -H "Accept: application/vnd.github+json" https://api.github.com/repos/rhino-linux/dotfiles/commits | grep sha | head -1 | cut -f4 -d'"'
}
version="$(pkgver)"
url="https://github.com/rhino-linux/dotfiles/archive/${version}.tar.gz"

prepare() {
  true
}

build() {
  sudo mkdir -p "${pkgdir}/usr/share/backgrounds"
  sudo mkdir -p "${pkgdir}/usr/share/doc"
  sudo mkdir -p "${pkgdir}/etc/skel/.config"
}

install() {
  # Install doc
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${name}"
  # Install
  sudo cp -r xfce4 "${pkgdir}/etc/skel/.config"
  sudo install -Dm644 "rolling-rhino-default.png" -t /usr/share/backgrounds
}

postinst() {
  # To update for current user
  cp -r /etc/skel/.config "$HOME"
}
