#Contributor: abcd567
#Maintainer: abcd567

pkgname=piaware
pkgver=latest
pkgrel=1

pkgdesc="Flightaware ADS-B data feeder"

arch=('i686' 'i386' 'x86_64' 'amd64' 'armv6h' 'armv6l' 'armv7h' 'armv7l' 'armv8h' 'armv8l' 'aarch64' 'arm64')
url="https://github.com/flightaware/piaware"
license=('BSD')

makedepends=('git' 'fakeroot' 'patch' 'autoconf' 'gcc' 'make' 'binutils' 'python'
             'python-build' 'python-setuptools' 'python-wheel' 'python-installer'
             'which' 'tcllauncher')

depends=('tcllib' 'tcltls' 'tclx' 'net-tools')

optdepends=('mlat-client')

source=('piaware::git+https://github.com/flightaware/piaware'
        'faup1090::git+https://github.com/flightaware/dump1090')

md5sums=('SKIP' 'SKIP')

install=piaware.install

backup=(etc/piaware.conf)

pkgver() {
  cd ${srcdir}/piaware
  git describe --tags | sed 's/-.*//'
}

build() {
## Build faup1090
  cd ${srcdir}/faup1090
  git fetch --all
  git reset --hard origin/master
  patch -p0 -i ../../faup1090-Makefile.patch
  make faup1090

## Build piaware
  cd ${srcdir}/piaware
  git fetch --all
  git reset --hard origin/master
  make
}

package() {
## Package faup1090
  cd ${srcdir}/faup1090
  install -Dm755 ${srcdir}/faup1090/faup1090 ${pkgdir}/usr/lib/piaware/helpers/faup1090

## Package piaware
  cd ${srcdir}/piaware
  make install DESTDIR=${pkgdir} SYSTEMD=/usr/lib/systemd/system
  install -dm755 ${pkgdir}/var/cache/piaware
  install -dm750 ${pkgdir}/etc/sudoers.d/
  install -Dm644 etc/piaware.sudoers ${pkgdir}/etc/sudoers.d/01piaware
  install -Dm640 ../../piaware.conf ${pkgdir}/etc/piaware.conf
  chmod -x ${pkgdir}/usr/lib/systemd/system/piaware.service
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}


