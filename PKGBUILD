#Contributor: abcd567
#Maintainer: abcd567

pkgname=piaware
pkgver=latest
pkgrel=1

pkgdesc="Flightaware ADS-B data feeder"

arch=('i686' 'i386' 'x86_64' 'amd64' 'armv6h' 'armv6l' 'armv7h' 'armv7l' 'armv8h' 'armv8l' 'aarch64' 'arm64')
url="https://github.com/flightaware/piaware"
license=('BSD')

depends=('git' 'pkgconf' 'autoconf' 'tcltls' 'tcl' 'tcllib' 'tclx' 'tk' 'tcllauncher'
         'python' 'python-setuptools' 'python-build' 'python-installer' 'net-tools')

source=('piaware::git+https://github.com/flightaware/piaware'
        'faup1090::git+https://github.com/flightaware/dump1090'
        'fa-mlat-client::git+https://github.com/mutability/mlat-client')

md5sums=('SKIP' 'SKIP' 'SKIP')

install=piaware.install

pkgver() {
  cd ${srcdir}/piaware
  git describe --tags | sed 's/-.*//'
}

package() {
## Build faup1090
  cd ${srcdir}/faup1090
  git fetch --all
  git reset --hard origin/master
  make faup1090
  install -Dm755 ${srcdir}/faup1090/faup1090 ${pkgdir}/usr/lib/piaware/helpers/faup1090

## Build fa-mlat-client
  cd ${srcdir}/fa-mlat-client
  git fetch --all
  git reset --hard origin/master
  ## ./setup.py install --prefix=${pkgdir}/usr
  python -m build --wheel --no-isolation
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm755 ${pkgdir}/usr/bin/fa-mlat-client  ${pkgdir}/usr/lib/piaware/helpers/fa-mlat-client
  rm ${pkgdir}/usr/bin/mlat-client
  rm ${pkgdir}/usr/bin/fa-mlat-client
  
## Build piaware
  cd ${srcdir}/piaware
  git fetch --all
  git reset --hard origin/master
  make install DESTDIR=${pkgdir} SYSTEMD=/usr/lib/systemd/system

  install -dm755 ${pkgdir}/var/cache/piaware
  install -dm750 ${pkgdir}/etc/sudoers.d/
  install -Dm644 etc/piaware.sudoers ${pkgdir}/etc/sudoers.d/01piaware
  install -Dm640 ../../piaware.conf ${pkgdir}/etc/piaware.conf
  chmod -x ${pkgdir}/usr/lib/systemd/system/piaware.service
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
